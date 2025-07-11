import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Screen"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Title ${index + 1}"),
            subtitle: const Text("Subtitle"),
            trailing: Transform.flip(
                flipX: true, child: const Icon(Icons.arrow_back_ios)),
          );
        },
      ),
    );
  }
}
