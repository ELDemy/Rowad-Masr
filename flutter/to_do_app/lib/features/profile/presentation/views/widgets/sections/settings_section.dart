import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        const SubtitleText("Settings"),
        Row(
          children: [
            SvgPicture.asset('assets/icons/profile_icons/setting-2.svg'),
            const SizedBox(width: 10),
            const Text(
              "App Settings",
              style: TextStyle(fontSize: 16),
            ),
            const Spacer(),
            const Icon(Icons.navigate_next_outlined),
          ],
        ),
      ],
    );
  }
}
