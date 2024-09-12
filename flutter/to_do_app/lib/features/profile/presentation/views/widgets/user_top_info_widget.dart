import 'package:flutter/material.dart';

class UserTopInfo extends StatelessWidget {
  const UserTopInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/avatar.jpg'),
          radius: 85 / 2,
        ),
        SizedBox(height: 10),
        Text(
          "Mahmoud ELDemerdash",
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
