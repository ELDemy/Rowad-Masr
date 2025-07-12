import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:to_do_app/data/models/task_model/task_model.dart';
import 'package:to_do_app/core/utiles/app_colors.dart';
import 'package:to_do_app/features/add_todo/presentation/views/detail_task_view/detail_task_view.dart';
import 'package:to_do_app/features/calendar/presentation/views/widgets/task_circle_icon.dart';
import 'package:to_do_app/helper/datetime_extension.dart';

import 'task_props.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.taskModel});
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: InkWell(
        onTap: () => PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: DetailTaskView(taskModel: taskModel),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.fade,
        ),
        child: Container(
          padding:
              const EdgeInsets.only(top: 12, right: 10, left: 10, bottom: 4),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: AppColors.greyBackgroundColor,
          ),
          child: Row(
            children: [
              TaskCircleIcon(taskModel: taskModel),
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
                        TaskProps(taskModel: taskModel),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //
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
    return Expanded(
      child: Text(
        formatTime(taskModel),
        style: const TextStyle(
          fontSize: 14,
          height: 21 / 14,
          color: AppColors.lightWhite,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
