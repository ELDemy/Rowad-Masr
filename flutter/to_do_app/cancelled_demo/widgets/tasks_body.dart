import 'package:flutter/material.dart';

import '../models/task_model.dart';
import 'note_card.dart';

class TasksBody extends StatelessWidget {
  TasksBody({super.key});

  List<TaskModel> tasksList = [
    TaskModel(title: "TODO TITLE", subTitle: "SUB TITLE"),
    TaskModel(title: "TODO TITLE", subTitle: "SUB TITLE"),
    TaskModel(title: "TODO TITLE", subTitle: "SUB TITLE"),
    TaskModel(title: "TODO TITLE", subTitle: "SUB TITLE"),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      children:
          tasksList.map((TaskModel task) => NoteCard(task: task)).toList(),
    );
  }
}
