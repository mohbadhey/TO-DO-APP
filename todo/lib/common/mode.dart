import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../model/todo_model.dart';
import '../provider/date_time_provider.dart';
import '../provider/radio_provider.dart';
import '../provider/todo_serviceprovider.dart';
import '../widgets/dateandtime.dart';
import '../widgets/radio.dart';
import '../widgets/text_filed.dart';

class addnewTask extends ConsumerWidget {
  addnewTask({
    super.key,
  });
  final titlecontroller = TextEditingController();
  final descriptioncontroller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateprov = ref.watch(dateProvider);
    return SingleChildScrollView(
      reverse: true ,
      
      child: Container(
        padding: const EdgeInsets.all(30),
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
                width: double.infinity,
                child: Text(
                  "Shaqada Cusub ",
                  textAlign: TextAlign.center,
                )),
            const Divider(
              thickness: 1.5,
            ),
            const Text("Ciwaanka Shaqada"),
            const SizedBox(height: 3),
            textfield(
              maxlinee: 1,
              txtcontroller: titlecontroller,
            ),
            const SizedBox(height: 3),
            const Text("Qeexida"),
            const SizedBox(height: 3),
            textfield(
              maxlinee: 5,
              txtcontroller: descriptioncontroller,
            ),
            const SizedBox(height: 9),
            const Text("Nooca"),
            Row(
              children: [
                Expanded(
                  child: radiowidget(
                    name: "LRN",
                    valueInput: 1,
                    onchageValue: () =>
                        ref.watch(radioProvider.notifier).update((state) => 1),
                  ),
                ),
                Expanded(
                  child: radiowidget(
                    name: "WRK",
                    valueInput: 2,
                    onchageValue: () =>
                        ref.watch(radioProvider.notifier).update((state) => 2),
                  ),
                ),
                Expanded(
                  child: radiowidget(
                    name: 'OTH',
                    valueInput: 3,
                    onchageValue: () =>
                        ref.watch(radioProvider.notifier).update((state) => 3),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                dateandtimewidget(
                  iconsection: Icons.date_range,
                  valueText: dateprov.toString(),
                  titletext: 'date',
                  badheye: () async {
                    final getvalue = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2021),
                        lastDate: DateTime(2025));

                    if (getvalue != null) {
                      final format = DateFormat.yMd();

                      ref
                          .read(dateProvider.notifier)
                          .update((state) => format.format(getvalue));
                    }
                  },
                ),
                const SizedBox(
                  width: 9,
                ),
                dateandtimewidget(
                  iconsection: Icons.dataset,
                  valueText: ref.watch(timeProvider),
                  titletext: 'time',
                  badheye: () async {
                    final gettime = await showTimePicker(
                        context: context, initialTime: TimeOfDay.now());

                    if (gettime != null) {
                      ref
                          .read(timeProvider.notifier)
                          .update((state) => gettime.format(context));
                    }
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("laabo"))),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: ElevatedButton(
                  onPressed: () {
                    final getradiovalue = ref.read(radioProvider);

                    String category = '';
                    switch (getradiovalue) {
                      case 1:
                        category = "learning";
                        break;
                      case 2:
                        category = "working ";
                        break;
                      case 3:
                        category = "general";
                        break;
                    }

                    ref.read(serviceProvider).addTask(TodModel(

                          titleTask: titlecontroller.text,
                          description: descriptioncontroller.text,
                          category: category,
                          dateTask: ref.read(dateProvider),
                          timeTask: ref.read(timeProvider),
                          isDone: false
                        ));
                            titlecontroller.clear();
                 descriptioncontroller.clear();
                  ref.read(radioProvider.notifier).update((state) => 0);
                  Navigator.pop(context);
                
                  },
                  child: const Text("gali"),
                

                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
