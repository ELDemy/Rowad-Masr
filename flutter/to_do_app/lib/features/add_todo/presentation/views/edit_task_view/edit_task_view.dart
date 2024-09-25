import 'package:flutter/material.dart';
import 'package:to_do_app/core/models/task_model.dart';

import 'widgets/edit_task_app_bar.dart';
import 'widgets/task_title_details.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({super.key, required this.taskModel});

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
            ],
          ),
        ),
      ),
    );
  }
}
