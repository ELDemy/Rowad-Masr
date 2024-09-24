import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_app/core/models/task_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
  });

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        InkWell(
          onTap: () {
            GetIt.I.get<TaskModel>().category = category;
          },
          child: Container(
            height: 64,
            width: 64,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: category.color,
            ),
            child: Icon(
              category.icon,
              size: 32,
              color: Colors.black.withOpacity(.5),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          category.category,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            height: 21.07 / 14,
          ),
        ),
      ],
    );
  }
}
