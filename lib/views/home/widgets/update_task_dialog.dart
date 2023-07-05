import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../backend/cloud_frestore.dart';
import '../../../models/todo.dart';
import '../../../utils/common_style.dart';

class UpdateTaskAlertDialog extends StatefulWidget {
  final String id;
  const UpdateTaskAlertDialog({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<UpdateTaskAlertDialog> createState() => _UpdateTaskAlertDialogState();
}

class _UpdateTaskAlertDialogState extends State<UpdateTaskAlertDialog> {
  final taskNameController = TextEditingController();
  final taskDescController = TextEditingController();
  final taskTags = const ['공부', '운동', '기타'];
  String selectedValue = '';

  @override
  Widget build(BuildContext context) {
    Todo todo = getTaskInfo(widget.id) as Todo;
    taskNameController.text = todo.taskName;
    taskDescController.text = todo.taskDesc;
    selectedValue = todo.taskTag;
    String title = todo.taskName;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return AlertDialog(
      scrollable: true,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: Colors.orange),
      ),
      content: SizedBox(
        height: height * 0.35,
        width: width,
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: taskNameController,
                style: commonTextStyle,
                decoration: commonInputDecoration(
                    const Icon(CupertinoIcons.square_list,
                        color: Colors.orange),
                    '할일'),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: taskDescController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: commonTextStyle,
                decoration: commonInputDecoration(
                    Icon(CupertinoIcons.bubble_left_bubble_right,
                        color: Colors.orange),
                    '설명'),
              ),
              SizedBox(height: 15),
              Row(
                children: <Widget>[
                  Icon(CupertinoIcons.tag, color: Colors.orange),
                  SizedBox(width: 15.0),
                  Expanded(
                    child: DropdownButtonFormField2(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      isExpanded: true,
                      hint: Text('태그 설정', style: commonTextStyle),
                      items: taskTags
                          .map(
                            (item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item, style: commonTextStyle),
                            ),
                          )
                          .toList(),
                      onChanged: (String? value) => setState(() {
                        if (value != null) selectedValue = value;
                      }),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
          child: const Text('취소'),
        ),
        ElevatedButton(
          onPressed: () {
            /*addTasks(
              taskName: taskNameController.text,
              taskDesc: taskDescController.text,
              taskTag: selectedValue,
              taskDescController: taskDescController,
              taskNameController: taskNameController,
            );
            Navigator.of(context, rootNavigator: true).pop();*/
          },
          child: const Text('저장'),
        ),
      ],
    );
  }
}
