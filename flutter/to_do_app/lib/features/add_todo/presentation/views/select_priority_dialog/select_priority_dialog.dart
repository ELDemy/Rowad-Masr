import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_app/core/models/task_model.dart';
import 'package:to_do_app/core/utiles/app_colors.dart';
import 'package:to_do_app/core/utiles/icons.dart';
import 'package:to_do_app/core/widgets/custom_alert_dialog.dart';

class SelectPriorityDialog extends StatelessWidget {
  const SelectPriorityDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: "Task Priority",
      editButtonText: "Save",
      onEdit: () {
        Navigator.pop(context);
      },
      content: SizedBox(
        width: MediaQuery.sizeOf(context).width - 90,
        height: 60 * (10 / 3).ceil().toDouble(),
        child: const _PriorityGrid(),
      ),
    );
  }
}

class _PriorityGrid extends StatefulWidget {
  const _PriorityGrid();
  @override
  State<_PriorityGrid> createState() => _PriorityGridState();
}

class _PriorityGridState extends State<_PriorityGrid> {
  @override
  Widget build(BuildContext context) {
    return AlignedGridView.count(
      shrinkWrap: true,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      crossAxisCount: 4,
      itemCount: 10,
      itemBuilder: (context, index) {
        bool isSelected = GetIt.I.get<TaskModel>().priority == index + 1;
        return InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: () {
            GetIt.I.get<TaskModel>().priority = index + 1;
            setState(() => isSelected = true);
          },
          child: _PriorityWidget(isSelected: isSelected, index: index),
        );
      },
    );
  }
}

class _PriorityWidget extends StatelessWidget {
  const _PriorityWidget({
    required this.isSelected,
    required this.index,
  });

  final bool isSelected;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: 64,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color:
            isSelected ? AppColors.purplePrimaryColor : AppColors.darkGreyColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            TaskIcons.flag,
          ),
          const SizedBox(height: 5),
          Text(
            "${index + 1}",
            style: const TextStyle(
              fontSize: 16,
              height: 21 / 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
