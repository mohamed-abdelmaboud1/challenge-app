import 'package:flutter/material.dart';
import 'task.dart';

class TaskPriorityBadge extends StatelessWidget {
  final TaskPriority priority;

  const TaskPriorityBadge({super.key, required this.priority});

  @override
  Widget build(BuildContext context) {
    String priorityText;
    Color backgroundColor;
    Color textColor;

    switch (priority) {
      case TaskPriority.high:
        priorityText = 'HIGH';
        backgroundColor = Colors.red.shade100;
        textColor = Colors.red.shade800;
        break;
      case TaskPriority.low:
        priorityText = 'LOW';
        backgroundColor = Colors.green.shade100;
        textColor = Colors.green.shade800;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        priorityText,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }
}