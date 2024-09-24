import 'package:flutter/material.dart';
import 'package:to_do_app/core/utiles/app_colors.dart';

class BottomSheetTextFormField extends StatefulWidget {
  const BottomSheetTextFormField({
    super.key,
    required this.controller,
    this.hintText,
    this.autofocus = false,
    this.maxLines = 2,
  });

  final TextEditingController controller;
  final String? hintText;
  final bool autofocus;
  final int maxLines;

  @override
  State<BottomSheetTextFormField> createState() =>
      _BottomSheetTextFormFieldState();
}

class _BottomSheetTextFormFieldState extends State<BottomSheetTextFormField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();

    // Add a listener to the focus node to detect focus changes
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    // Always dispose the FocusNode when done
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: TextFormField(
        focusNode: _focusNode,
        autofocus: widget.autofocus,
        controller: widget.controller,
        style: const TextStyle(
          fontSize: 18,
          height: 27.09 / 18,
        ),
        minLines: 1,
        maxLines: widget.maxLines,
        decoration: InputDecoration(
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: AppColors.lightWhite),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.greyOutline,
            ),
          ),
          contentPadding: _isFocused
              ? const EdgeInsets.symmetric(vertical: 8, horizontal: 16)
              : const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        ),
      ),
    );
  }
}
