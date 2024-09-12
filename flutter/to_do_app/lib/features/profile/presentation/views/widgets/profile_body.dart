import 'package:flutter/material.dart';

import 'row_tasks_info_widget.dart';
import 'sections/settings_section.dart';
import 'user_top_info_widget.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 24),
            UserTopInfo(),
            SizedBox(height: 20),
            TasksInfoWidget(),
            SizedBox(height: 32),
            SettingsSection(),
          ],
        ),
      ),
    );
  }
}
