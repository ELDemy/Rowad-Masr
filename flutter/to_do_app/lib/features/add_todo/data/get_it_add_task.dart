import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_app/core/models/task_model.dart';

void getItTaskModel() {
  GetIt.I.registerSingleton<TaskModel>(
    TaskModel(
      title: '',
      dateTime: DateTime.now(),
      category: CategoryModel(
        category: "category",
        color: const Color(0xff809CFF),
        icon: Icons.medical_information,
      ),
    ),
  );
}
