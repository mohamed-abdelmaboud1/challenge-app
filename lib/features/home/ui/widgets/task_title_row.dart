import 'package:flutter/material.dart';
import 'task.dart';
import 'task_priority_badge.dart';

class TaskTitleRow extends StatelessWidget {
  final Task task;

  const TaskTitleRow({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            task.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: task.isCompleted ? Colors.grey : Colors.black87,
              decoration: task.isCompleted ? TextDecoration.lineThrough : null,
            ),
          ),
        ),
        const SizedBox(width: 8),
        TaskPriorityBadge(priority: task.priority),
      ],
    );
  }
}