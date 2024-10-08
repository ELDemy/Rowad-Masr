import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:to_do_app/core/models/task_model.dart';
import 'package:to_do_app/core/utiles/app_colors.dart';
import 'package:to_do_app/core/widgets/custom_alert_dialog.dart';

import 'category_item.dart';

class SelectCategoryDialog extends StatefulWidget {
  const SelectCategoryDialog({super.key});

  @override
  State<SelectCategoryDialog> createState() => _SelectCategoryDialogState();
}

class _SelectCategoryDialogState extends State<SelectCategoryDialog> {
  final List<CategoryModel> categories = CategoryModel.categoriesList;
  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: "Choose Category",
      withActions: false,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width - 90,
            height: 100 * (categories.length / 3).ceil().toDouble(),
            child: AlignedGridView.count(
              shrinkWrap: true,
              mainAxisSpacing: 16,
              crossAxisSpacing: 50,
              crossAxisCount: 3,
              itemCount: categories.length,
              itemBuilder: (context, index) => CategoryItem(
                category: categories[index],
              ),
            ),
          ),
          _actionContainer(),
        ],
      ),
    );
  }

  GestureDetector _actionContainer() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 11),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.purplePrimaryColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Text(
          "Add Category",
          style: TextStyle(
            fontSize: 16,
            height: 24.08 / 16,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
