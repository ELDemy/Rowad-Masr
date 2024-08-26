import 'student_abstract_class.dart';
import 'student_event_abstract_class.dart';

class Undergraduate extends Student implements StudentEvent {
  Undergraduate({
    required super.registrationNumber,
    required super.fullName,
    required super.marks,
  });

  @override
  double calcGPA() {
    double sum = 0;
    for (double mark in marks) {
      switch (mark) {
        case >= 95:
          sum += 12;
          break;
        case >= 90:
          sum += 11.5;
          break;
        case >= 85:
          sum += 11;
          break;
        case >= 80:
          sum += 10;
          break;
        case >= 75:
          sum += 9;
          break;
        case >= 70:
          sum += 8;
          break;
        case >= 65:
          sum += 7;
          break;
        case >= 60:
          sum += 6;
          break;
        case >= 56:
          sum += 5;
          break;
        case >= 53:
          sum += 4;
          break;
        case >= 50:
          sum += 3;
          break;
        default:
          sum += 0;
          break;
      }
    }
    GPA = sum / (marks.length * 3);
    return GPA!;
  }

  @override
  void printInfo() {
    super.printInfo();
    print("GPA: ${calcGPA()}");
  }
}
