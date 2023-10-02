

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../common/mode.dart';
import '../image_avator.dart';
import '../provider/todo_serviceprovider.dart';
import '../widgets/card_todo_list.dart';

class HomePage extends ConsumerWidget {
    HomePage({super.key});
  DateTime currentDateTime = DateTime.now();



  
  @override
  Widget build(BuildContext context , WidgetRef ref) {
    final todoData = ref.watch(fetchStreamProvider);
    String formattedDateTime = DateFormat("yyyy-MM-dd HH:mm:ss").format(currentDateTime);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar:AppBar(
        
        toolbarHeight: 75,
  backgroundColor: Colors.white,
  foregroundColor: Colors.black,
  elevation: 0,
  title: ListTile(
   
    //contentPadding: const EdgeInsets.only(right: 30),
    leading: const imagesAvator(),
    title: Text(
      "hello im",
      style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
    ),
    subtitle: const Text(
      "mohamed badhey",
    ),
  ),
  actions: [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.calendar_month),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.beach_access_outlined),
        ),
      ]),
    ),
  ],
),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 17,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Maanta"),
                      Text(formattedDateTime),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () => showModalBottomSheet(
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          context: context,
                          builder: (context) =>  addnewTask()),
                      child: const Text("+ shaqo cusub")),
                      //card list
                     
                ],
              ),
              const SizedBox(height: 14,),

          
              ListView.builder(
                itemCount:todoData.value!.length,
                shrinkWrap: true,
                
                itemBuilder: ((context, index) =>    cardlistw(getIndex: index,)))
                
            ],
          ),
        ),
      ),
    );
  }
}



