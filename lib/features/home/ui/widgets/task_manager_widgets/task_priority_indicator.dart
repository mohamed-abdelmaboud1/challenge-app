import 'package:flutter/material.dart';
import '../../../data/models/task.dart';

class TaskPriorityIndicator extends StatelessWidget {
  final TaskPriority priority;

  const TaskPriorityIndicator({super.key, required this.priority});

  @override
  Widget build(BuildContext context) {
    Color priorityColor;
    switch (priority) {
      case TaskPriority.high:
        priorityColor = Colors.red;
        break;
      case TaskPriority.low:
        priorityColor = Colors.green;
        break;
    }

    return Container(
      width: 4,
      height: 50,
      decoration: BoxDecoration(
        color: priorityColor,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}