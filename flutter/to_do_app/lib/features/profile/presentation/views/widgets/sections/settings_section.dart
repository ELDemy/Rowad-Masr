import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/utiles/icons.dart';

import 'option_row_widget.dart';
import 'subtitle_text_widget.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 4),
          child: SubtitleText("Settings"),
        ),
        OptionRowWidget(
          text: "App Settings",
          leftIcon: SvgPicture.asset(ProfileIcons.settings),
        ),
      ],
    );
  }
}
