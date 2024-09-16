import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/core/utiles/app_colors.dart';
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
      theme: ThemeData(
        primaryColor: AppColors.kPrimaryColor,
        textTheme: GoogleFonts.latoTextTheme(ThemeData.dark().textTheme),
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          centerTitle: true,
        ),
      ),
      home: const MyPersistentBottomNavBar(),
    );
  }
}
