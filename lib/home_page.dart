// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/utilities/dialogue_box.dart';
import 'package:todo_app/utilities/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // refernce the box
  final _myBox = Hive.box('mybox');
  final _controller = TextEditingController();

  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // if this is first time opening app
    if (_myBox.get('TODOTASK') == null) {
      db.createInitialData();
    } else {
      // data already exits not first time
      db.loadData();
    }
    super.initState();
  }

  void checkboxChanged(bool? value, int index) {
    setState(() {
      db.todoTask[index][1] = !db.todoTask[index][1];
    });
    db.updateDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.todoTask.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
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

  void deletedTask(int index) {
    setState(() {
      db.todoTask.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(
          child: Text(
            'TODO',
            style: TextStyle(color: Colors.white),
          ),
        ),
        elevation: 9,
        backgroundColor: Colors.grey[800],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.todoTask.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.todoTask[index][0],
            completedTask: db.todoTask[index][1],
            onChanged: (value) => checkboxChanged(value, index),
            deleteTask: (context) => deletedTask(index),
          );
        },
      ),
    );
  }
}
