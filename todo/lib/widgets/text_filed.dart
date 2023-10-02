// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/material.dart';

class textfield extends StatelessWidget {
  const textfield({
    Key? key,
    required this.maxlinee,
    required this.txtcontroller,
  }) : super(key: key);
final int maxlinee;

final TextEditingController txtcontroller;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Focus.of(context).unfocus(),
      child: Container(
        decoration: BoxDecoration(color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12)
        ),
      
        child:  TextField(
          decoration: const InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
    
          ),
             onSubmitted: (_) {},
          controller: txtcontroller,
    
          maxLines: maxlinee,
        
        )),
    );
  }
}
