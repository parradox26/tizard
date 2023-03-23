import 'package:flutter/material.dart';
import 'package:tizard/models/task.dart';

class TaskItem extends StatefulWidget {
  final Task task;

  const TaskItem({Key? key, required this.task}) : super(key: key);

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool _isChecked = false;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 16.0),
      leading: Checkbox(
        value: _isChecked,
        onChanged: (value) {
          setState(() {
            _isChecked = value!;
            widget.task.completed = _isChecked;
            // call method to update task in database
            updateTask(widget.task);
          });
        },
      ),
      title: Text(widget.task.title),
      subtitle: Text(widget.task.description, overflow: TextOverflow.ellipsis),
      onExpansionChanged: (value) {
        setState(() {
          _isExpanded = value;
        });
      },
      initiallyExpanded: _isExpanded,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text("Due Date: ${widget.task.dueDate.toString()}"),
        ),
      ],
    );
  }

  void updateTask(Task task) {
    // implement code to update task in database here
    // for example, you can use a database helper class
    // and call a method to update the task
  }
}
