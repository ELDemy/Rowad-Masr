import 'dart:io';

import 'q1_class_of_students/client_class.dart';
import 'q1_class_of_students/student_class.dart';

void main() {
  Client client = Client();
  List<Student> studentsList = client.studentsList;

  for (Student student in studentsList) {
    print("Please enter the student name: ");
    student.setName = stdin.readLineSync();

    print("Please enter the student major: ");
    student.setMajor = stdin.readLineSync();

    print("Please enter the student gpa: ");
    student.setGPA = double.parse(numReadLineSync());
  }
  print("The Average GPA is : ${client.averageGPA}\n");

  print("Enter A registration number:  ");
  int rNumber = int.parse(numReadLineSync());
  print(client.findStudent(rNumber) ?? "Registration number not found!!");

  List<Student> twoStudents = client.compareAll();
  print("Student with the highest GPA:\n${twoStudents[0]} ");
  print("Student with the lowest GPA:\n${twoStudents[1]} ");

  print("Students sorted by GPA:");
  for (Student student in client.sortedStudents) {
    print(student);
  }
}

String numReadLineSync() {
  String? userInput = stdin.readLineSync();
  if (userInput == null || userInput == "") userInput = "0";
  return userInput;
}
