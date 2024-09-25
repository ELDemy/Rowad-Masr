import 'package:flutter/material.dart';

import 'custom_text_form_field.dart';

class AddTaskFormFields extends StatelessWidget {
  const AddTaskFormFields({
    super.key,
    required this.titleController,
    required this.descriptionController,
  });

  final TextEditingController titleController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14, bottom: 19),
      child: Column(
        children: [
          // const SizedBox(height: 14),
          CustomTextFormField(
            controller: titleController,
            hintText: "Title",
            autofocus: true,
          ),
          CustomTextFormField(
            controller: descriptionController,
            hintText: "Description",
            maxLines: 15,
          ),
          // const SizedBox(height: 19),
        ],
      ),
    );
  }
}
