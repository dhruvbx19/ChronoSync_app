// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app/utilities/dialogue_box.dart';
import 'package:todo_app/utilities/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List todoTask = [
    ["Make Tutorial", false],
    ["Learn Tutorial", true],
    ["Revise Tutorial", true],
    ["Write Tutorial", true],
  ];

  void checkboxChanged(bool? value, int index) {
    setState(() {
      todoTask[index][1] = !todoTask[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      todoTask.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSaveTask: saveNewTask,
            onCancelTask: () => Navigator.of(context).pop(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'TODO',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 9,
        backgroundColor: Colors.grey[800],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: todoTask.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: todoTask[index][0],
            completedTask: todoTask[index][1],
            onChanged: (value) => checkboxChanged(value, index),
          );
        },
      ),
    );
  }
}
