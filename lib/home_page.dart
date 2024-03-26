// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
