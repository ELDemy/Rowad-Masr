import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/tasks_body.dart';

class CompletedTasksPage extends StatelessWidget {
  const CompletedTasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text("Completed Tasks"),
      ),
      body: TasksBody(),
    );
  }
}
