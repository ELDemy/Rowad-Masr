import 'package:flutter/material.dart';

class View1 extends StatelessWidget {
  const View1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF009788),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.red,
              width: 110,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 90,
                    height: 95,
                    margin: const EdgeInsets.only(left: 3, top: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE35432),
                      border:
                          Border.all(color: const Color(0xFF4DFC19), width: 4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    color: const Color(0xFFFFEB3C), width: 110, height: 110),
                Container(
                    color: const Color(0xFF8BC24A), width: 110, height: 110)
              ],
            ),
            Container(color: Colors.blue, width: 110),
          ],
        ),
      ),
    );
  }
}
