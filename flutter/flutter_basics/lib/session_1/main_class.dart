import 'package:flutter/material.dart';

import 'view_2.dart';

class Session1 extends StatelessWidget {
  const Session1({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const View2(),
    );
  }
}
