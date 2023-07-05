import 'package:flutter/material.dart';

void clearAll(TextEditingController taskDescController,
    TextEditingController taskNameController) {
  taskNameController.text = '';
  taskDescController.text = '';
}
