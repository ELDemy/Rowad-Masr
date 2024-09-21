import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/models/task_model.dart';
import 'package:to_do_app/core/utiles/app_colors.dart';
import 'package:to_do_app/features/calendar/presentation/views/widgets/tasks_list/task_card/task_props.dart';
import 'package:to_do_app/helper/datetime_extension.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.taskModel});

  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.only(top: 12, right: 10, left: 10, bottom: 4),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: AppColors.greyBackgroundColor,
      ),
      child: Row(
        children: [
          Icon(
            Icons.circle_outlined,
            color: Colors.white.withOpacity(.87),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _taskTitle(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _taskTime(),
                    const TaskProps(),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding _taskTitle() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        taskModel.title,
        style: const TextStyle(
          fontSize: 16,
          height: 21 / 16,
          overflow: TextOverflow.ellipsis,
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
          color: AppColors.lightWight,
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
