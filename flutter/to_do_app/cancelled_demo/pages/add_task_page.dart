import 'package:flutter/material.dart';

import '../widgets/custom_elevated_button.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Task")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: "Title"),
            ),
            SizedBox(
              height: 32,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Details"),
            ),
            SizedBox(height: 48),
            CustomElevatedButton(
              width: double.maxFinite,
              child: Text(
                "ADD",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
