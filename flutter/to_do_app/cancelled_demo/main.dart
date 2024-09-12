import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xff9395D3),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff9395D3)),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff9395D3),
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          toolbarHeight: 80,
        ),
        fontFamily: 'Jost',
      ),
      home: const HomePage(),
    );
  }
}
