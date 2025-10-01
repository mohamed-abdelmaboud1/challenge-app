import 'package:flutter/cupertino.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final String taskTitle;
  final VoidCallback onConfirm;

  const DeleteConfirmationDialog({
    super.key,
    required this.taskTitle,
    required this.onConfirm,
  });

  static Future<bool?> show(
    BuildContext context,
    String taskTitle,
    VoidCallback onConfirm,
  ) {
    return showCupertinoDialog<bool>(
      context: context,
      builder: (context) =>
          DeleteConfirmationDialog(taskTitle: taskTitle, onConfirm: onConfirm),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Delete Task'),
      content: Text('Are you sure you want to delete "$taskTitle"?'),
      actions: [
        CupertinoDialogAction(
          child: const Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        CupertinoDialogAction(
          isDestructiveAction: true,
          child: const Text('Delete'),
          onPressed: () {
            Navigator.of(context).pop(true);
            onConfirm();
          },
        ),
      ],
    );
  }
}
