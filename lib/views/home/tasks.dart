import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/backend/cloud_frestore.dart';
import '../../models/todo.dart';
import 'widgets/task_list_item.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  // 데이터를 가져오는 부분을 함수로 분리

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: StreamBuilder<List<Todo>>(
        stream: getTasksList(fireStore),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: Text('No tasks to display'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return TaskListItem(todo: snapshot.data![index]);
              },
            );
          }
        },
      ),
    );
  }
}
