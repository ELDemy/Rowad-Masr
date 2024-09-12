import 'package:flutter/material.dart';
import 'package:to_do_app/features/profile/presentation/views/widgets/sections/account_section.dart';
import 'package:to_do_app/features/profile/presentation/views/widgets/sections/logout_widget.dart';
import 'package:to_do_app/features/profile/presentation/views/widgets/sections/up_todo_section.dart';

import 'row_tasks_info_widget.dart';
import 'sections/settings_section.dart';
import 'user_top_info_widget.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 24),
            UserTopInfo(),
            SizedBox(height: 20),
            TasksInfoWidget(),
            SizedBox(height: 24),
            SettingsSection(),
            AccountSection(),
            UpTodoSection(),
            LogoutWidget(),
            SizedBox(height: 88),
          ],
        ),
      ),
    );
  }
}
