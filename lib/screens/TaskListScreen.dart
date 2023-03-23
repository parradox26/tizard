import 'package:flutter/material.dart';
import 'package:tizard/models/task.dart';
import 'package:tizard/widgets/TaskItem.dart';

class TaskListScreen extends StatelessWidget {
  final List<Task> tasks;

  const TaskListScreen({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          Task task = tasks[index];
          return TaskItem(task: task);
        },
      ),
    );
  }
}
