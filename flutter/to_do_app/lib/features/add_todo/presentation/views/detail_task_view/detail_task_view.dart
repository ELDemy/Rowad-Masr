import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/models/task_model.dart';
import 'package:to_do_app/core/utiles/icons.dart';
import 'package:to_do_app/helper/datetime_extension.dart';

import 'widgets/detail_task_prop.dart';
import 'widgets/edit_task_app_bar.dart';
import 'widgets/task_title_details.dart';

class DetailTaskView extends StatelessWidget {
  const DetailTaskView({super.key, required this.taskModel});

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const EditTaskAppBar(),
              TaskTitleDetails(taskModel: taskModel),
              _taskTime(),
              _taskCategory(),
              _taskPriority(),
              _subTasks(),
              _deleteTask(),
            ],
          ),
        ),
      ),
    );
  }

  DetailTaskProp _taskTime() {
    return DetailTaskProp(
      iconPath: TaskIcons.timer,
      propName: "Task Time :",
      child: Text(
        formatTime(taskModel),
        style:
            const TextStyle(fontSize: 12, height: 21 / 12, color: Colors.white),
      ),
    );
  }

  DetailTaskProp _taskCategory() {
    return DetailTaskProp(
      iconPath: TaskIcons.tag,
      propName: "Task Category :",
      child: Row(
        children: [
          Icon(taskModel.category.icon, color: taskModel.category.color),
          const SizedBox(width: 10),
          Text(
            taskModel.category.category,
            style: const TextStyle(
                fontSize: 12, height: 21 / 12, color: Colors.white),
          ),
        ],
      ),
    );
  }

  DetailTaskProp _taskPriority() {
    return DetailTaskProp(
      iconPath: TaskIcons.flag,
      propName: "Task Priority :",
      child: const Text(
        "Default",
        style: TextStyle(fontSize: 12, height: 21 / 12, color: Colors.white),
      ),
    );
  }

  DetailTaskProp _subTasks() {
    return DetailTaskProp(
      iconPath: TaskIcons.hierarchy,
      propName: "Sub - Task",
      child: const Text(
        "Add Sub - Task",
        style: TextStyle(fontSize: 12, height: 21 / 12, color: Colors.white),
      ),
    );
  }

  Widget _deleteTask() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          SvgPicture.asset(TaskIcons.trash),
          const SizedBox(width: 8),
          const Text(
            "Delete Task",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xffFF4949),
            ),
          ),
        ],
      ),
    );
  }
}
