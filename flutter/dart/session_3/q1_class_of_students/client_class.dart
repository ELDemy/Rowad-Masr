import 'package:collection/collection.dart';

import 'student_class.dart';

class Client {
  List<Student> studentsList = [];

  Client({int numberOfStudents = 5}) {
    studentsList = List.generate(
      numberOfStudents,
      (i) =>
          Student(name: "AAA", major: "Information Systems", gpa: i.toDouble()),
    );
  }

  get averageGPA {
    double sum = 0;
    studentsList
        .forEach((student) => sum += student.gpa); // why map didn't work
    return sum / studentsList.length;
  }

  Student? findStudent(int rNumber) {
    return studentsList.firstWhereOrNull(
        (Student student) => student.registrationNumber == rNumber);
  }

  List<Student> compareAll() {
    Student lowerStudent = studentsList[0];
    Student higherStudent = studentsList[0];

    for (Student student in studentsList) {
      if (student.gpa > higherStudent.gpa) {
        higherStudent = student;
      } else if (student.gpa < lowerStudent.gpa) {
        lowerStudent = student;
      }
    }

    return [higherStudent, lowerStudent];
  }

  get sortedStudents {
    List<Student> sortedList = List.from(studentsList);
    sortedList.sort((b, a) => a.gpa.compareTo(b.gpa));
    return sortedList;
  }
}
