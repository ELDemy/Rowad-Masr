import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/core/utiles/icons.dart';

import 'option_row_widget.dart';
import 'subtitle_text_widget.dart';

class UpTodoSection extends StatelessWidget {
  const UpTodoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubtitleText("UpTodo"),
        OptionRowWidget(
          text: "About US",
          leftIcon: SvgPicture.asset(ProfileIcons.menu),
        ),
        OptionRowWidget(
          text: "FAQ",
          leftIcon: SvgPicture.asset(ProfileIcons.infoCircle),
        ),
        OptionRowWidget(
          text: "Help & Feedback",
          leftIcon: SvgPicture.asset(ProfileIcons.flash),
        ),
        OptionRowWidget(
          text: "Support US",
          leftIcon: SvgPicture.asset(ProfileIcons.like),
        ),
      ],
    );
  }
}
