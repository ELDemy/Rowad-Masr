import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/core/utiles/constants.dart';
import 'package:to_do_app/domain/entities/task_entity.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String? description;
  @HiveField(3)
  DateTime dateTime;
  @HiveField(4)
  CategoryModel category;
  @HiveField(5)
  int priority;
  @HiveField(6)
  final List<TaskModel> subTasks = [];
  @HiveField(7)
  bool isCompleted;

  TaskModel({
    this.id,
    required this.title,
    required this.dateTime,
    required this.category,
    this.description,
    this.priority = 1,
    this.isCompleted = false,
  });
  factory TaskModel.fromEntity(TaskEntity entity) {
    return TaskModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      dateTime: entity.dateTime,
      priority: entity.priority,
      isCompleted: entity.isCompleted,
      category: CategoryModel.fromEntity(entity.category),
    );
  }

  TaskEntity toEntity() {
    return TaskEntity(
      title: title,
      description: description,
      dateTime: dateTime,
      priority: priority,
      isCompleted: isCompleted,
      category: category.toEntity(),
    );
  }

  void addSubTask(TaskModel taskModel) {
    subTasks.add(taskModel);
  }
}

@HiveType(typeId: 1)
class CategoryModel {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String category;
  @HiveField(2)
  final Color color;
  @HiveField(3)
  final int _iconCode;

  IconData get icon => IconData(_iconCode, fontFamily: 'MaterialIcons');

  CategoryModel(
      {this.id,
      required this.category,
      required this.color,
      required IconData icon})
      : _iconCode = icon.codePoint;

  factory CategoryModel.fromEntity(CategoryEntity entity) {
    return CategoryModel(
      id: entity.id,
      category: entity.category,
      color: entity.color,
      icon: entity.icon,
    );
  }

  CategoryEntity toEntity() {
    return CategoryEntity(
      category: category,
      color: color,
      icon: icon,
    );
  }

  static CategoryModel defaultCategory() {
    return CategoryModel(
      id: 0,
      category: 'Default',
      color: Colors.grey,
      icon: Icons.help_outline,
    );
  }

  static List<CategoryModel> categoriesList =
      Hive.box<CategoryModel>(AppConsts.categoriesBox).values.toList();
}
