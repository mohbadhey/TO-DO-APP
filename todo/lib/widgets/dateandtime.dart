// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class dateandtimewidget extends ConsumerWidget {
  const dateandtimewidget({
    Key? key,
    required this.titletext,
    required this.valueText,
    required this.iconsection,
    required this.badheye,
  }) : super(key: key);
final String titletext;
final String valueText;
final IconData iconsection;
final VoidCallback badheye;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child:  Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
           Text(titletext),
          Material(
            child: Ink(

    
              decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10)
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: badheye,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  
                  ),
                  child:  Row(children: [
                    Icon(iconsection),
                    Text(valueText),
                  ]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
