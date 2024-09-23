import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/models/task_model.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());
  String title = '';
  String description = '';
  DateTime dateTime = DateTime.now();
  int priority = 1;
  CategoryModel category =
      CategoryModel(category: "category", color: Colors.white, icon: Icons.add);

  TaskModel getTask() {
    return TaskModel(
      title: title,
      description: description,
      dateTime: dateTime,
      category: category,
      priority: priority,
    );
  }
}
