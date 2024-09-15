import 'package:flutter/material.dart';

class UserTopInfo extends StatelessWidget {
  const UserTopInfo({
    super.key,
  });

  static String name = "Mahmoud ELDemerdash";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/avatar.jpg'),
          radius: 85 / 2,
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
