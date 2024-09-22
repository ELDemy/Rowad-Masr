import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/models/task_model.dart';
import 'package:to_do_app/core/state_management/tasks_cubit/tasks_cubit.dart';
import 'package:to_do_app/features/bottom_nav_bar/data/nav_bar_data.dart';

class AddTodoView extends StatefulWidget {
  const AddTodoView({super.key});

  @override
  State<AddTodoView> createState() => _AddTodoViewState();
}

class _AddTodoViewState extends State<AddTodoView> {
  final TaskModel tasksList = TaskModel(
    title: "Business meeting with CEO",
    dateTime: DateTime.now(),
    category: CategoryModel(
      category: "category",
      color: const Color(0xffFFCC80),
      icon: Icons.work_outline_rounded,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        children: [
          Center(
            child: IconButton(
              onPressed: () {
                BlocProvider.of<TasksCubit>(context).addTask(tasksList);
                Navigator.pop(context);
                NavBarData.controller.jumpToTab(1);
              },
              icon: const Center(child: Icon(Icons.add)),
            ),
          ),
          TextField(),
        ],
      ),
    );
  }
}
