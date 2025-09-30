import 'package:flutter/material.dart';

import '../../../../core/widgets/border_beam.dart';
import 'add_task_button.dart';
import 'task.dart';
import 'task_count_section.dart';

class TaskManagerHeader extends StatelessWidget {
  final List<Task> tasks;
  final VoidCallback onAddTask;

  const TaskManagerHeader({
    super.key,
    required this.tasks,
    required this.onAddTask,
  });

  @override
  Widget build(BuildContext context) {
    return BorderBeam(
      duration: 15,
      borderWidth: 5,
      colorFrom: Colors.blue.shade800,
      colorTo: Colors.white,
      staticBorderColor: Colors.transparent,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade400, Colors.blue.shade600],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TaskCountSection(tasks: tasks),
            AddTaskButton(onPressed: onAddTask),
          ],
        ),
      ),
    );
  }
}
