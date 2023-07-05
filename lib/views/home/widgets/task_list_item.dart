import 'package:flutter/material.dart';
import 'package:todo_app/backend/cloud_frestore.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/views/home/widgets/update_task_dialog.dart';

class TaskListItem extends StatelessWidget {
  final Todo todo;

  const TaskListItem({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color taskColor = Colors.blue;
    if (todo.taskTag == '일') {
      taskColor = Colors.red;
    } else if (todo.taskTag == '학습') {
      taskColor = Colors.green;
    }

    return Container(
      height: 100,
      margin: const EdgeInsets.only(bottom: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ListTile(
          leading: Container(
            width: 20,
            height: 20,
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundColor: taskColor,
            ),
          ),
          title: Text(todo.taskName),
          subtitle: Text(todo.taskDesc),
          isThreeLine: true,
          trailing: PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: '수정',
                  child: const Text(
                    '수정',
                    style: TextStyle(fontSize: 13.0),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => UpdateTaskAlertDialog(
                        id: todo.id.toString(),
                      ),
                    );
                  },
                ),
                PopupMenuItem(
                  value: '삭제',
                  child: const Text(
                    '삭제',
                    style: TextStyle(fontSize: 13.0),
                  ),
                  onTap: () {
                    deleteTask(todo.id.toString());
                  },
                ),
              ];
            },
          )),
    );
  }
}
