import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List todoTask = [];

  // reference our box
  final _myBox = Hive.box('mybox');

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    todoTask = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];
  }

  // load the data from database
  void loadData() {
    todoTask = _myBox.get("TODOTASK");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("TODOTASK", todoTask);
  }
}