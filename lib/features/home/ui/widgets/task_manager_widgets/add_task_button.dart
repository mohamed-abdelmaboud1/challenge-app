import 'package:flutter/material.dart';

class AddTaskButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddTaskButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: true,
      onPressed: onPressed,
      backgroundColor: Colors.white,
      foregroundColor: Colors.blue.shade600,
      child: const Icon(Icons.add),
    );
  }
}
