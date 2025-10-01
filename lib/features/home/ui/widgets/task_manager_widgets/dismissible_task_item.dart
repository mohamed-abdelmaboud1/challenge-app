import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../data/models/task.dart';
import 'delete_confirmation_dialog.dart' show DeleteConfirmationDialog;
import 'dismiss_background.dart';
import 'task_card.dart';

class DismissibleTaskItem extends StatelessWidget {
  final Task task;
  final int index;
  final Function(Task) onToggleCompletion;
  final Function(Task, int) onDelete;
  final Function(Task) onDeleteConfirm;

  const DismissibleTaskItem({
    super.key,
    required this.task,
    required this.index,
    required this.onToggleCompletion,
    required this.onDelete,
    required this.onDeleteConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Dismissible(
        key: ValueKey<int>(task.id),
        direction: DismissDirection.horizontal,
        background: DismissBackground(isLeft: true),
        secondaryBackground: DismissBackground(isLeft: false),
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.endToStart) {
            return await _showDeleteConfirmation(context);
          } else {
            onToggleCompletion(task);
            return false;
          }
        },
        onDismissed: (direction) => onDelete(task, index),
        child: TaskCard(task: task),
      ),
    );
  }

  Future<bool?> _showDeleteConfirmation(BuildContext context) async {
    return await DeleteConfirmationDialog.show(
      context,
      task.title,
      () {},
    );
  }
}