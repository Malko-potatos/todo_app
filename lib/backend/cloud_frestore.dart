import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/todo.dart';
import '../utils/text_field_controll.dart';

Future<void> addTasks(
    {required String taskName,
    required String taskDesc,
    required String taskTag,
    required TextEditingController taskDescController,
    required TextEditingController taskNameController}) async {
  // Todo 객체를 생성합니다.
  Todo todo = Todo(
    taskName: taskName,
    taskDesc: taskDesc,
    taskTag: taskTag,
  );

  // Todo 객체를 JSON으로 변환합니다.
  Map<String, dynamic> todoJson = todo.toJson();

  // Todo JSON을 Firestore에 추가합니다.
  DocumentReference docRef =
      await FirebaseFirestore.instance.collection('tasks').add(todoJson);

  // 선택적으로 문서 ID를 문서에 추가합니다.
  String taskId = docRef.id;
  await FirebaseFirestore.instance
      .collection('tasks')
      .doc(taskId)
      .update({'id': taskId});

  // 텍스트 필드를 지웁니다.
  clearAll(taskDescController, taskNameController);
}

Stream<List<Todo>> getTasksList(FirebaseFirestore fireStore) {
  return fireStore.collection('tasks').snapshots().map((snapshot) {
    return snapshot.docs.map((doc) => Todo.fromDocument(doc)).toList();
  });
}

Future<Todo?> getTaskInfo(String id) async {
  try {
    final DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('tasks').doc(id).get();

    if (snapshot.exists) {
      return Todo.fromDocument(snapshot);
    }
  } catch (e) {
    print('Error retrieving task: $e');
  }
}

Future<void> deleteTask(String taskId) async {
  try {
    await FirebaseFirestore.instance.collection('tasks').doc(taskId).delete();
    Fluttertoast.showToast(
      msg: "성공적으로 제거 되었습니다.",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  } catch (error) {
    Fluttertoast.showToast(
      msg: "Failed: $error",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }
}
