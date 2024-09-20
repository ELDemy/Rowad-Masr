import 'package:flutter/material.dart';

import 'task_card.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return const TaskCard();
          },
        ),
      ),
    );
  }
}
