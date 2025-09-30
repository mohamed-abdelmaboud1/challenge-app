import 'package:flutter/material.dart';
import 'task.dart';

class TaskCountSection extends StatelessWidget {
  final List<Task> tasks;

  const TaskCountSection({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Task Manager',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          '${tasks.where((t) => !t.isCompleted).length} pending tasks',
          style: const TextStyle(fontSize: 14, color: Colors.white70),
        ),
      ],
    );
  }
}