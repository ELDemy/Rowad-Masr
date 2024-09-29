import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/core/models/task_model.dart';
import 'package:to_do_app/core/utiles/app_colors.dart';
import 'package:to_do_app/core/utiles/icons.dart';
import 'package:to_do_app/features/calendar/presentation/views/widgets/task_circle_icon.dart';

class TaskTitleDetails extends StatelessWidget {
  const TaskTitleDetails({super.key, required this.taskModel});
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, right: 12, bottom: 38),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TaskCircleIcon(taskModel: taskModel),
          const SizedBox(width: 21),
          _taskTitle(),
          _editTaskButton(),
        ],
      ),
    );
  }

  InkWell _editTaskButton() => InkWell(
        onTap: () {},
        child: SvgPicture.asset(TaskIcons.edit2),
      );

  Expanded _taskTitle() {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Do Math Homework" ?? taskModel.title,
            style: const TextStyle(
              fontSize: 20,
              height: 21 / 20,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            "Do chapter 2 to 5 for next week" ?? taskModel.description!,
            style: const TextStyle(
              fontSize: 16,
              height: 24.08 / 16,
              color: AppColors.lightWhite,
            ),
          ),
        ],
      ),
    );
  }
}
