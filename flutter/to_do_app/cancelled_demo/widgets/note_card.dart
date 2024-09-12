import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/task_model.dart';
import '../pages/edit_task_page.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.task,
  });

  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      color: Colors.white,
      elevation: 4,
      shadowColor: Colors.grey,
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      task.title,
                      style: const TextStyle(
                        color: Color(0xff9395D3),
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Text(
                    task.subTitle,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                GestureDetector(
                    child: SvgPicture.asset("assets/icons/Pencil.svg"),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditTaskPage(task: task)))),
                const SizedBox(width: 20),
                SvgPicture.asset("assets/icons/Trash.svg"),
                const SizedBox(width: 20),
                SvgPicture.asset("assets/icons/CheckCircle.svg"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
