// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/todo_serviceprovider.dart';

class cardlistw extends ConsumerWidget {
   const cardlistw({super.key, 
    required this.getIndex,
  });

  final int getIndex;

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    final todoData = ref.watch(fetchStreamProvider);
    return todoData.when(data: (todoData) => Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        
      ),
      child: Row(
       children: [
         Container(
     decoration: const BoxDecoration(
       color: Color.fromARGB(255, 111, 255, 28),
       borderRadius: BorderRadius.only(
         topLeft: Radius.circular(12),
         bottomLeft: Radius.circular(12),
         )
     ),
           width: 30,
         

         ),
          Expanded(
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 8),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 ListTile(
                   contentPadding: EdgeInsets.zero,
                   leading: IconButton(onPressed:()=> ref.read(serviceProvider).deleTask(todoData[getIndex].docID),
                    icon: const Icon(CupertinoIcons.delete)),
                   title:  Text(todoData[getIndex].titleTask , maxLines: 1,
                   style: TextStyle(
                    decoration: todoData[getIndex].isDone ? TextDecoration.lineThrough : null
                   ),
                   ),
                   subtitle:  Text(todoData[getIndex].description , maxLines: 1,
                    style: TextStyle(
                    decoration: todoData[getIndex].isDone ? TextDecoration.lineThrough : null
                   ),
                   ),
                   trailing: Transform.scale(
                  scale: 1.5,
                   child: Checkbox(
                     shape: const CircleBorder(),
                     value: todoData[getIndex].isDone, onChanged: (value)=>
                      ref.read(serviceProvider).updateTask(todoData[getIndex].docID, value))),
                 ),
                  Transform.translate(
                   offset: const Offset(0, -12),

                    child: Container(child: Column(
                     children: [
                       Divider(
                     thickness: 1.5,
                     color: Colors.grey.shade200,
                                              ),
                                               Row(children: [
                      Text(todoData[getIndex].dateTask),
                     const SizedBox(width: 10,),
                     Text(todoData[getIndex].timeTask)
                                              ],)
                     ],
                    ),),
                  )
               ],
             ),
             
             ),
         ),
       ],
      ),
    ) ,
    
    
    
    
    

    // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
    error: (error , StackTrace)=>  const Center(child: Text("error")), 
    
    
    loading: ()=> const Center(child: CircularProgressIndicator(),));


    






    
    
    
    
    
  }
}


/* 
     */