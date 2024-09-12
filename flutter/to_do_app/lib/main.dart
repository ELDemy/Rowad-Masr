import 'package:flutter/material.dart';
import 'package:to_do_app/features/bottom_nav_bar/presentation/views/bottom_nav_view.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Up todo",
      theme: ThemeData.dark(),
      home: const MyPersistentBottomNavBar(),
    );
  }
}
