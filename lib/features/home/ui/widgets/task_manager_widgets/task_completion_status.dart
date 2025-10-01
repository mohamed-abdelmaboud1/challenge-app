import 'package:flutter/material.dart';

class TaskCompletionStatus extends StatelessWidget {
  final bool isCompleted;

  const TaskCompletionStatus({super.key, required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
          size: 16,
          color: isCompleted ? Colors.green : Colors.grey.shade400,
        ),
        const SizedBox(width: 8),
        Text(
          isCompleted ? 'Completed' : 'Pending',
          style: TextStyle(
            fontSize: 12,
            color: isCompleted ? Colors.green : Colors.grey.shade600,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
