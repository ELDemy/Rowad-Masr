/*
.5
Write a program that asks the user to input a number of apples, then tells him
how many dozens of apples he has and how many extra apples are left over.
(Test your program using different values such as 21, 36 and 8 apples). Hint:
Use the division and modulus operators taking advantage of the truncation when integer
division is performed. (This hint also goes to questions 7, 8, 9 and IO).
 */
import 'dart:io';

void applesQ() {
  int applesCount = int.parse(stdin.readLineSync()!);
  int dozens = (applesCount / 12).toInt();
  int leftOver = applesCount % 12;

  print("You have ${dozens} dozens of apple and ${leftOver} left over");
}
