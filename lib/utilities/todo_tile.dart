// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool completedTask;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;

  TodoTile({
    super.key,
    required this.taskName,
    required this.completedTask,
    required this.onChanged,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(8),
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.white,
            )
          ],
        ),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Checkbox(
                  value: completedTask,
                  onChanged: onChanged,
                ),
                Text(
                  taskName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      decoration: completedTask
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      decorationColor: Colors.white),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.grey[900], borderRadius: BorderRadius.circular(18)),
        ),
      ),
    );
  }
}
