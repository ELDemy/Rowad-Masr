/*
6. Write a program that asks the user to input a distance in meters. Then, the
program breaks it into kilometers and meters. (Test your program using
various values such as 1048, 780, 3000 meters).
 */
import 'dart:io';

void metersQ() {
  print("Please enter the distance in meters : ");
  double distance = double.parse(stdin.readLineSync()!);
  int km = (distance / 1000).toInt();
  double meters = distance % 1000;

  print(
      "The distance in Kilometers is $km km\nthe distance in meters is $meters m");
}
