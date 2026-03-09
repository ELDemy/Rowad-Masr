import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_app/data/models/task_model/task_model.dart';

void getItTaskModel() {
  GetIt.I.registerSingleton<TaskModel>(
    TaskModel(
      id: 0,
      title: '',
      dateTime: DateTime.now(),
      category: CategoryModel(
        id: 0,
        category: "category",
        color: Colors.blue,
        icon: Icons.add,
      ),
    ),
  );
}
