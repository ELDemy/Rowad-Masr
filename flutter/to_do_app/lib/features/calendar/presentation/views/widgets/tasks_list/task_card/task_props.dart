import 'package:flutter/material.dart';
import 'package:to_do_app/core/models/task_model.dart';
import 'package:to_do_app/core/utiles/app_colors.dart';

class TaskProps extends StatelessWidget {
  const TaskProps({super.key, required this.taskModel});

  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _taskCategory(),
        const SizedBox(width: 12),
        _priorityWidget(),
      ],
    );
  }

  Container _taskCategory() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: taskModel.category.color,
        ),
        child: Row(
          children: [
            Icon(
              taskModel.category.icon,
              size: 14,
              color: Colors.black.withOpacity(.6),
            ),
            const SizedBox(width: 5),
            Text(
              taskModel.category.category,
              style: const TextStyle(
                fontSize: 12,
                height: 21 / 12,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );

  Container _priorityWidget() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.purplePrimaryColor),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            const Icon(Icons.flag_outlined, size: 14),
            const SizedBox(width: 5),
            Text(
              taskModel.priority.toString(),
              style: const TextStyle(fontSize: 12, height: 21 / 12),
            )
          ],
        ),
      );
}
