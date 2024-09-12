import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import '../widgets/tasks_body.dart';
import 'add_task_page.dart';
import 'completed_tasks.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CompletedTasksPage()));
          }
          setState(() => _currentIndex = index);
        },
        iconSize: 30,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "All"),
          BottomNavigationBarItem(icon: Icon(Icons.check), label: "Compeleted"),
        ],
      ),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("TODO APP",
                style: TextStyle(fontWeight: FontWeight.bold)),
            SvgPicture.asset("assets/icons/calendar.svg")
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 70,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: kPrimaryColor,
            foregroundColor: Colors.white,
            shape: CircleBorder(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddTaskPage()),
              );
            },
            child: Icon(
              Icons.add_sharp,
              size: 23,
            ),
          ),
        ),
      ),
      body: TasksBody(),
    );
  }
}
