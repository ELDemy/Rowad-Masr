import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/models/task_model.dart';
import 'package:to_do_app/core/utiles/app_colors.dart';
import 'package:to_do_app/core/utiles/icons.dart';
import 'package:to_do_app/features/calendar/presentation/views/widgets/task_circle_icon.dart';
import 'package:to_do_app/helper/datetime_extension.dart';

class TaskTitleDetails extends StatelessWidget {
  const TaskTitleDetails({super.key, required this.taskModel});
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          Row(
            children: [
              TaskCircleIcon(taskModel: taskModel),
              const SizedBox(width: 21),
              _taskTitle(),
              Container(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(TaskIcons.edit2)),
            ],
          ),
        ],
      ),
    );
  }

  Expanded _taskTitle() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(
          taskModel.title,
          style: const TextStyle(
            fontSize: 20,
            height: 21 / 20,
          ),
        ),
      ),
    );
  }

  Widget _taskTime() {
    String taskTime = compareDates();
    return Expanded(
      child: Text(
        taskTime,
        style: const TextStyle(
          fontSize: 14,
          height: 21 / 14,
          color: AppColors.lightWhite,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  String compareDates() {
    if (taskModel.dateTime.isSameDate(DateTime.now())) {
      return "Today At ${DateFormat("HH:mm").format(taskModel.dateTime)}";
    } else if (taskModel.dateTime.year == DateTime.now().year) {
      return DateFormat("MMM d At HH:mm").format(taskModel.dateTime);
    } else {
      return DateFormat("y MMM d").format(taskModel.dateTime);
    }
  }
}
