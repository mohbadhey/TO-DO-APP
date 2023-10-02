

import 'package:cloud_firestore/cloud_firestore.dart';





class TodModel {

  String? docID;
  
  final String description;
  final  String category;
  final String dateTask;
  final String timeTask;
  final String titleTask;
  final bool isDone;

   TodModel({
    this.docID,
    required this.description,
    required this.category,
    required this.dateTask,
    required this.timeTask,
    required this.titleTask,
    required this.isDone
  });

  


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      
      'description': description,
      'category': category,
      'dateTask': dateTask,
      'timeTask': timeTask,
      'titleTask': titleTask,
      'isDone' : isDone
    };
  }

  factory TodModel.fromMap(Map<String, dynamic> map) {
    return TodModel(
      docID: map['docID'] != null ? map["docID"]  as String : null,
      description: (map["description"] ?? '') as String,
      category: (map["category"] ?? '') as String,
      dateTask: (map["dateTask"] ?? '') as String,
      timeTask: (map["timeTask"] ?? '') as String,
      titleTask: (map["titleTask"] ?? '') as String,
      isDone:    (map["isDone"] ?? '') as bool,
    );
  }

 factory TodModel.fromSnapshot(DocumentSnapshot<Map<String , dynamic>> doc){
  return TodModel(
    docID: doc.id,
    
    description: doc['description'],
    category: doc['category'], 
    dateTask: doc['dateTask'],
       timeTask: doc['timeTask'],
    titleTask: doc['titleTask'] ,
  
    isDone : doc['isDone'],
    );


}
}
