import 'package:flutter/material.dart';
import 'package:to_do_app/core/models/task_model.dart';

import 'task_card/task_card.dart';

class TasksListView extends StatefulWidget {
  const TasksListView({super.key});

  @override
  State<TasksListView> createState() => _TasksListViewState();
}

class _TasksListViewState extends State<TasksListView> {
  final List<TaskModel> tasksList = [
    TaskModel(title: "Business meeting with CEO", dateTime: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return TaskCard(taskModel: tasksList[0]);
          },
        ),
      ),
    );
  }
}
