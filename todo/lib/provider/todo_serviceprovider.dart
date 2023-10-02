
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/model/todo_model.dart';

import '../services/todo_servoce.dart';

final serviceProvider = StateProvider<TodoService>((ref) {
  return TodoService();
});

final fetchStreamProvider = StreamProvider<List<TodModel>>((ref) async* {
  final getData = FirebaseFirestore.instance.collection('todoApp').snapshots().map
  ((event) => event.docs.map((snapshot) => TodModel.fromSnapshot(snapshot)).toList());
 yield* getData;
});