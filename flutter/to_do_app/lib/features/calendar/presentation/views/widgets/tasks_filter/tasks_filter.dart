import 'package:flutter/material.dart';
import 'package:to_do_app/core/utiles/app_colors.dart';

import 'action_container.dart';

class TasksFilter extends StatefulWidget {
  const TasksFilter({super.key});

  @override
  State<TasksFilter> createState() => _TasksFilterState();
}

class _TasksFilterState extends State<TasksFilter> {
  bool filterCompleted = false;
  bool filterToday = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      margin: const EdgeInsets.only(top: 20, right: 25, left: 25),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ActionContainer(
            text: "Today",
            filter: filterToday,
            onTap: () {
              setState(() {
                filterToday = true;
                filterCompleted = false;
              });
            },
          ),
          const SizedBox(width: 40),
          ActionContainer(
            text: "Completed",
            filter: filterCompleted,
            onTap: () {
              setState(() {
                filterToday = false;
                filterCompleted = true;
              });
            },
          ),
        ],
      ),
    );
  }
}
