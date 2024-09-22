import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/state_management/tasks_cubit/tasks_cubit.dart';

import 'task_card/task_card.dart';

class TasksListView extends StatefulWidget {
  const TasksListView({super.key});

  @override
  State<TasksListView> createState() => _TasksListViewState();
}

class _TasksListViewState extends State<TasksListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: BlocBuilder<TasksCubit, TasksState>(
          builder: (context, state) {
            print(state);
            if (state is ShowTasks) {
              return ListView.builder(
                itemCount: state.tasksList.length,
                itemBuilder: (BuildContext context, int index) {
                  return TaskCard(taskModel: state.tasksList[index]);
                },
              );
            } else {
              return const Center(child: Text("No Tasks yet"));
            }
          },
        ),
      ),
    );
  }
}
