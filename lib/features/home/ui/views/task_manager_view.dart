import 'package:challenge_app/core/enums/snack_bar_type.dart';
import 'package:challenge_app/core/extensions/show_snack_bar_extension.dart';
import 'package:challenge_app/features/home/data/models/task.dart';
import 'package:challenge_app/features/home/ui/widgets/task_manager_widgets/dismissible_task_item.dart';
import 'package:flutter/material.dart';

import '../widgets/task_empty_state.dart';
import '../widgets/task_manager_background.dart' show TaskManagerBackground;
import '../widgets/task_manager_header.dart' show TaskManagerHeader;

class TaskManagerView extends StatefulWidget {
  const TaskManagerView({super.key});

  @override
  State<TaskManagerView> createState() => _TaskManagerViewState();
}

class _TaskManagerViewState extends State<TaskManagerView> {
  late List<Task> tasks;

  @override
  void initState() {
    super.initState();
    initializeTasks();
  }

  void initializeTasks() {
    tasks = [
      const Task(
        id: 0,
        title: "Complete Drag & Drop Challenge",
        description: "Finish the drag and drop challenge app",
        priority: TaskPriority.high,
      ),
      const Task(
        id: 1,
        title: "Review Code",
        description: "Check for any bugs and improvements",
        priority: TaskPriority.high,
      ),
      const Task(
        id: 2,
        title: "Update Documentation",
        description: "Add comments and README updates",
        priority: TaskPriority.low,
      ),
      const Task(
        id: 3,
        title: "Fix UI Issues",
        description: "Resolve responsive design problems",
        priority: TaskPriority.high,
      ),
    ];
  }

  void addNewTask() {
    final newTask = Task(
      id: tasks.length,
      title: "New Task ${tasks.length + 1}",
      description: "This is a newly added task",
      priority: TaskPriority.values[tasks.length % TaskPriority.values.length],
    );

    setState(() {
      tasks.insert(0, newTask);
    });

    context.showCustomSnackBar('New task added!', type: SnackBarType.success);
  }

  void toggleTaskCompletion(Task task) {
    final taskIndex = tasks.indexWhere((t) => t.id == task.id);
    if (taskIndex != -1) {
      setState(() {
        tasks[taskIndex] = task.copyWith(isCompleted: !task.isCompleted);
      });

      context.showCustomSnackBar(
        task.isCompleted
            ? 'Task marked as pending!'
            : 'Task marked as completed!',
        type: task.isCompleted ? SnackBarType.info : SnackBarType.success,
        action: SnackBarAction(
          label: 'Undo',
          textColor: Colors.blue.shade600,
          onPressed: () {
            final currentIndex = tasks.indexWhere((t) => t.id == task.id);
            if (currentIndex != -1) {
              setState(() {
                tasks[currentIndex] = tasks[currentIndex].copyWith(
                  isCompleted: !tasks[currentIndex].isCompleted,
                );
              });
            }
          },
        ),
      );
    }
  }

  void deleteTask(Task task, int index) {
    setState(() {
      tasks.removeAt(index);
    });

    context.showCustomSnackBar(
      'Task "${task.title}" deleted',
      type: SnackBarType.error,
      action: SnackBarAction(
        label: 'Undo',
        textColor: Colors.blue.shade600,
        onPressed: () {
          setState(() {
            tasks.insert(index, task);
          });
        },
      ),
    );
  }

  void reorderTasks(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final Task item = tasks.removeAt(oldIndex);
      tasks.insert(newIndex, item);
    });

    context.showCustomSnackBar(
      'Task reordered successfully!',
      type: SnackBarType.info,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TaskManagerBackground(
        child: Column(
          children: [
            TaskManagerHeader(tasks: tasks, onAddTask: addNewTask),
            const SizedBox(height: 16),
            Expanded(
              child: tasks.isEmpty
                  ? const TaskEmptyState()
                  : ReorderableListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: tasks.length,
                      onReorder: reorderTasks,
                      itemBuilder: (context, index) {
                        final task = tasks[index];
                        return DismissibleTaskItem(
                          key: ValueKey(task.id),
                          task: task,
                          index: index,
                          onToggleCompletion: toggleTaskCompletion,
                          onDelete: deleteTask,
                          onDeleteConfirm: (_) async => true,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
