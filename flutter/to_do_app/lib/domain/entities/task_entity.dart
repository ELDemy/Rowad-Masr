import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:to_do_app/core/utiles/constants.dart';
import 'package:to_do_app/data/models/task_model/task_model.dart';

class TaskEntity {
  final int? id;
  final String title;
  final String? description;
  final DateTime dateTime;
  final CategoryEntity category;
  final int priority;
  final List<TaskEntity> subTasks = [];
  bool isCompleted;

  TaskEntity({
    this.id,
    required this.title,
    required this.dateTime,
    required this.category,
    this.description,
    this.priority = 1,
    this.isCompleted = false,
  });

  void addSubTask(TaskEntity taskEntity) {
    subTasks.add(taskEntity);
  }
}

class CategoryEntity {
  final int? id;
  final String category;

  final Color color;

  final int _iconCode;

  IconData get icon => IconData(_iconCode, fontFamily: 'MaterialIcons');

  CategoryEntity(
      {this.id,
      required this.category,
      required this.color,
      required IconData icon})
      : _iconCode = icon.codePoint;

  static List<CategoryModel> categoriesList =
      Hive.box<CategoryModel>(AppConsts.categoriesBox).values.toList();
}
