import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/utiles/icons.dart';

import 'option_row_widget.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return OptionRowWidget(
      text: "Log out",
      leftIcon: SvgPicture.asset(ProfileIcons.logout),
      rightArrow: false,
    );
  }
}
