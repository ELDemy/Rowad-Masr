import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/core/utiles/constants.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String? description;
  @HiveField(2)
  DateTime dateTime;
  @HiveField(3)
  CategoryModel category;
  @HiveField(4)
  int priority;
  @HiveField(5)
  final List<TaskModel> subTasks = [];
  @HiveField(6)
  bool isCompleted = false;

  TaskModel({
    required this.title,
    this.description,
    required this.dateTime,
    required this.category,
    this.priority = 1,
  });

  void addSubTask(TaskModel taskModel) {
    subTasks.add(taskModel);
  }
}

@HiveType(typeId: 1)
class CategoryModel {
  @HiveField(0)
  final String category;
  @HiveField(1)
  final Color color;
  @HiveField(2)
  final int _iconCode;

  IconData get icon => IconData(_iconCode, fontFamily: 'MaterialIcons');

  CategoryModel(
      {required this.category, required this.color, required IconData icon})
      : _iconCode = icon.codePoint;

  static List<CategoryModel> categoriesList =
      Hive.box<CategoryModel>(AppConsts.categoriesBox).values.toList();
}
