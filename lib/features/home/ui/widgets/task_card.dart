import 'package:flutter/material.dart';

import 'task.dart';
import 'task_content.dart';
import 'task_priority_indicator.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: task.isCompleted ? Colors.grey.shade100 : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: task.isCompleted ? Colors.grey.shade300 : Colors.transparent,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            TaskPriorityIndicator(priority: task.priority),
            const SizedBox(width: 16),
            Expanded(child: TaskContent(task: task)),
          ],
        ),
      ),
    );
  }
}
