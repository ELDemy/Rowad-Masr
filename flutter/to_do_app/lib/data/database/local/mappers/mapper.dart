import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/data/database/local/dao/task_dao.dart';

import 'package:to_do_app/data/models/task_model/task_model.dart';

import '../app_database.dart';

CategoryModel fromCategoryData(Category category) {
  return CategoryModel(
    id: category.id,
    category: category.category,
    color: Color(category.colorValue),
    icon: IconData(category.iconCode, fontFamily: 'MaterialIcons'),
  );
}

CategoriesCompanion toCategoryCompanion(CategoryModel categoryModel) {
  return CategoriesCompanion.insert(
    category: categoryModel.category,
    colorValue: categoryModel.color.value,
    iconCode: categoryModel.icon.codePoint,
  );
}

// Task mappers
TasksCompanion toTaskCompanion(TaskModel taskModel) {
  return TasksCompanion.insert(
    title: taskModel.title,
    description: Value(taskModel.description),
    dueDate: taskModel.dateTime,
    categoryId: taskModel.category.id!, // Use actual category ID
    priority: Value(taskModel.priority),
    isCompleted: Value(taskModel.isCompleted),
  );
}

TasksCompanion toTaskCompanionWithId(TaskModel taskModel) {
  return TasksCompanion(
    id: Value(taskModel.id!),
    title: Value(taskModel.title),
    description: Value(taskModel.description),
    dueDate: Value(taskModel.dateTime),
    categoryId: Value(taskModel.category.id!),
    priority: Value(taskModel.priority),
    isCompleted: Value(taskModel.isCompleted),
  );
}

// Convert TaskWithCategory to TaskModel
TaskModel fromTaskWithCategory(TaskWithCategory taskWithCategory) {
  return TaskModel(
    id: taskWithCategory.task.id,
    title: taskWithCategory.task.title,
    description: taskWithCategory.task.description,
    dateTime: taskWithCategory.task.dueDate,
    priority: taskWithCategory.task.priority,
    isCompleted: taskWithCategory.task.isCompleted,
    category: taskWithCategory.category != null
        ? fromCategoryData(taskWithCategory.category!)
        : CategoryModel.defaultCategory(), // Provide default category
  );
}
