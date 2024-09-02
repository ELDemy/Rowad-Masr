import 'package:flutter/material.dart';
import 'package:flutter_basics/session_1/widgets/custom_app_bar.dart';

class View3 extends StatelessWidget {
  const View3({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: const CustomAppBar(),
          backgroundColor: const Color(0xFFEE534F),
          body: Padding(
            padding: const EdgeInsets.only(top: 30, right: 50),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(color: Colors.blue),
                Container(height: 200, color: Colors.green),
                Container(height: 150, width: 200, color: Colors.yellow)
              ],
            ),
          ),
        ),
        SafeArea(
            child: Container(
          margin: const EdgeInsets.only(left: 10, top: 8),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 10,
              ),
            ],
          ),
          child: const Text(
            "4",
            style: TextStyle(
                fontSize: 45,
                color: Color(0xFF68DC30),
                decoration: TextDecoration.none),
          ),
        )),
      ],
    );
  }
}
