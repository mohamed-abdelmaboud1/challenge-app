import 'package:challenge_app/core/enums/snack_bar_type.dart';
import 'package:challenge_app/core/extensions/show_snack_bar_extension.dart';
import 'package:challenge_app/features/home/ui/widgets/dismissible_task_item.dart';
import 'package:challenge_app/features/home/ui/widgets/task.dart';
import 'package:challenge_app/features/home/ui/widgets/task_empty_state.dart';
import 'package:challenge_app/features/home/ui/widgets/task_manager_background.dart';
import 'package:challenge_app/features/home/ui/widgets/task_manager_header.dart';
import 'package:flutter/material.dart';

class DismissibleExampleView extends StatefulWidget {
  const DismissibleExampleView({super.key});

  @override
  State<DismissibleExampleView> createState() => _DismissibleExampleViewState();
}

class _DismissibleExampleViewState extends State<DismissibleExampleView> {
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
        title: "Complete Drag Challenge",
        description: "Finish the drag and drop challenge app",
        priority: TaskPriority.high,
      ),
      const Task(
        id: 1,
        title: "Review Code",
        description: "Check for any bugs",
        priority: TaskPriority.high,
      ),
      const Task(
        id: 2,
        title: "Update Docs",
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
                  : ListView.builder(
                      itemCount: tasks.length,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) {
                        final task = tasks[index];
                        return DismissibleTaskItem(
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
