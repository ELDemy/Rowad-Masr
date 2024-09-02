import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("I'm an App"),
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 2,
      backgroundColor: const Color(0xFFE43935),
      shadowColor: Colors.black,
      surfaceTintColor: Colors.transparent,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
