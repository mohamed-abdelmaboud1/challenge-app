import 'package:flutter/material.dart';

class TaskDescription extends StatelessWidget {
  final String description;
  final bool isCompleted;

  const TaskDescription({
    super.key,
    required this.description,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(
        fontSize: 14,
        color: isCompleted ? Colors.grey.shade600 : Colors.grey.shade700,
        decoration: isCompleted ? TextDecoration.lineThrough : null,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
