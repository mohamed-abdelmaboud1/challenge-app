import 'package:flutter/material.dart';
import 'task.dart';
import 'task_title_row.dart';
import 'task_description.dart';
import 'task_completion_status.dart';

class TaskContent extends StatelessWidget {
  final Task task;

  const TaskContent({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TaskTitleRow(task: task),
        if (task.description.isNotEmpty) ...[
          const SizedBox(height: 8),
          TaskDescription(description: task.description, isCompleted: task.isCompleted),
        ],
        const SizedBox(height: 12),
        TaskCompletionStatus(isCompleted: task.isCompleted),
      ],
    );
  }
}