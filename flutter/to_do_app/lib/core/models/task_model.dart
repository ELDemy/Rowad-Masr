import 'package:flutter/cupertino.dart';

class TaskModel {
  final String title;
  final String? description;
  final DateTime dateTime;
  final CategoryModel? category;
  final int priority;
  final List<TaskModel> subTasks = [];

  TaskModel({
    required this.title,
    this.description,
    required this.dateTime,
    this.category,
    this.priority = 1,
  });

  void addSubTask(TaskModel taskModel) {
    subTasks.add(taskModel);
  }
}

class CategoryModel {
  final String category;
  final Color color;
  final Icon icon;

  CategoryModel(
      {required this.category, required this.color, required this.icon});
}
