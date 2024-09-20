import 'package:flutter/material.dart';
import 'package:to_do_app/core/utiles/app_colors.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 4),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: AppColors.greyBackgroundColor,
      ),
      child: Row(
        children: [
          const Icon(Icons.circle_outlined),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Text(
                    "Business meeting with CEO",
                    style: TextStyle(
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Today At 08:15"),
                    Row(
                      children: [
                        Container(width: 87, height: 29, color: Colors.blue),
                        Container(width: 87, height: 29, color: Colors.blue),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
