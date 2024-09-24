import 'package:flutter/material.dart';

class TaskModel {
  String title;
  String? description;
  DateTime dateTime;
  CategoryModel category;
  int priority;
  final List<TaskModel> subTasks = [];
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

class CategoryModel {
  final String category;
  final Color color;
  final IconData icon;

  CategoryModel(
      {required this.category, required this.color, required this.icon});

  static List<CategoryModel> categoriesList = [
    CategoryModel(
        category: "Grocery",
        color: Color(0xFFCCFF80),
        icon: Icons.local_grocery_store_outlined),
    CategoryModel(
        category: "Workk",
        color: Color(0xffFF9680),
        icon: Icons.work_outline_rounded),
    CategoryModel(
        category: "Sport",
        color: Color(0xff80FFFF),
        icon: Icons.sports_gymnastics),
    CategoryModel(
        category: "Design",
        color: Color(0xff80FFD9),
        icon: Icons.design_services),
    CategoryModel(
      category: "University",
      color: Color(0xff809CFF),
      icon: Icons.school_outlined,
    ),
    CategoryModel(
      category: "Social",
      color: Color(0xffFF80EB),
      icon: Icons.headphones,
    ),
  ];
}
