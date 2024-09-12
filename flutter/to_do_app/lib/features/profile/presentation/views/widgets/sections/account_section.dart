import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/core/utiles/icons.dart';

import 'option_row_widget.dart';
import 'subtitle_text_widget.dart';

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
        ),
        OptionRowWidget(
          text: "Change account password",
          leftIcon: SvgPicture.asset(ProfileIcons.key),
        ),
        OptionRowWidget(
          text: "Change account Image",
          leftIcon: SvgPicture.asset(ProfileIcons.camera),
        ),
      ],
    );
  }
}
