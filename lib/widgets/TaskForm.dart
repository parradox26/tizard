import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/task.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({super.key});

  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  String _taskName = '';
  String _taskDesc = '';
  DateTime _dueDate = DateTime.now();

  void _submitForm(String taskName, DateTime dueDate,String desc) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Task newTask =
          Task(id: const Uuid().v4(), title: _taskName, dueDate: _dueDate,description: desc);
      // Navigator.of(context).pop(newTask);
      Navigator.pop(context, newTask);

    }
  }

  void _handleDateSelection(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null && selectedDate != _dueDate) {
      setState(() {
        _dueDate = selectedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Task Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a task name';
              }
              return null;
            },
            onSaved: (value) {
              setState(() {
                _taskName = value!;
              });
            },
          ),
          const SizedBox(height: 20),
          TextFormField(decoration: const InputDecoration(labelText: 'Task Description'),
            validator: (value) {
              if (value == null) {
                return 'Please enter the description';
              }
              return null;
            },
            onSaved: (value) {
              setState(() {
                _taskDesc = value!;
              });
            },),
          const SizedBox(height: 20),
          Row(
            children: [
              const Text('Due Date: '),
              TextButton(
                onPressed: () => _handleDateSelection(context),
                child: Text(
                  _dueDate.toIso8601String(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                _submitForm(_taskName, _dueDate,_taskDesc);
              }
            },
            child: const Text('Save Task'),
          ),
        ],
      ),
    );
  }
}
