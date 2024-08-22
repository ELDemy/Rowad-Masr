/*
7. Write a program that asks the user to input a period of time in minutes. Then,
the program breaks it into hours and minutes. (Test your program using
various values such as 89, 180 and 50 minutes).
 */

import 'dart:io';

void timeQ() {
  print("Please enter the time in minutes: ");

  double time = double.parse(stdin.readLineSync()!);

  int hours = (time / 60).toInt();
  int minutes = (time % 60).toInt();
  print("The time is=>  $hours:$minutes");
}
