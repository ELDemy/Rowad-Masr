import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/core/utiles/icons.dart';
import 'package:to_do_app/features/profile/presentation/views/widgets/sections/acount_section/alert_dialogs/change_account_image_alert_dialog.dart';

import '../option_row_widget.dart';
import '../subtitle_text_widget.dart';
import 'alert_dialogs/change_account_name_alert_dialog.dart';
import 'alert_dialogs/change_account_password_alert_dialog.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubtitleText("Account"),
        OptionRowWidget(
          text: "Change account name",
          leftIcon: SvgPicture.asset(ProfileIcons.user),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return const ChangeNameAlertDialog();
              },
            );
          },
        ),
        OptionRowWidget(
          text: "Change account password",
          leftIcon: SvgPicture.asset(ProfileIcons.key),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return const ChangePasswordAlertDialog();
              },
            );
          },
        ),
        OptionRowWidget(
          text: "Change account Image",
          leftIcon: SvgPicture.asset(ProfileIcons.camera),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return const ChangeImageAlertDialog();
              },
            );
          },
        ),
      ],
    );
  }
}
