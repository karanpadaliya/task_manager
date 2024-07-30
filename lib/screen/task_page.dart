import 'package:flutter/material.dart';

class TaskDetailsPage extends StatelessWidget {
  final String task;

  TaskDetailsPage({required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          task,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
