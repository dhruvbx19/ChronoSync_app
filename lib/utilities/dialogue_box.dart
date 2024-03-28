// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todo_app/utilities/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSaveTask;
  VoidCallback onCancelTask;
   DialogBox({
    super.key,
    required this.controller,
    required this.onSaveTask,
    required this.onCancelTask,
  });

  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        width: 120,
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Enter new Task',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Save", onPressed: onSaveTask),
                SizedBox(
                  width: 9,
                ),
                MyButton(text: "Cancel", onPressed: onCancelTask)
              ],
            )
          ],
        ),
      ),
    );
  }
}
