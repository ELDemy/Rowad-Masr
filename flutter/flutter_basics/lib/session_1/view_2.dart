import 'package:flutter/material.dart';

class View2 extends StatelessWidget {
  const View2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEE534F),
      appBar: AppBar(
        title: Text("I'm an App"),
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 2,
        backgroundColor: Color(0xFFE43935),
        shadowColor: Colors.black,
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  CustomContainer("1"),
                  CustomContainer("2"),
                  CustomContainer("3"),
                ],
              ),
              Container(
                width: 90,
                height: 105,
                decoration: BoxDecoration(
                  color: const Color(0xFFE35432),
                  border: Border.all(color: const Color(0xFF4DFC19), width: 4),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.blue,
      child: Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
