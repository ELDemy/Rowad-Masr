import 'student_abstract_class.dart';
import 'student_event_abstract_class.dart';

class PostGraduate extends Student implements StudentEvent {
  PostGraduate({
    required super.registrationNumber,
    required super.fullName,
    required super.marks,
  });

  @override
  double calcGPA() {
    double sum = 0;
    for (double mark in marks) {
      switch (mark) {
        case >= 90:
          sum += 12;
          break;
        case >= 85:
          sum += 32 / 3;
          break;
        case >= 80:
          sum += 31 / 3;
          break;
        case >= 75:
          sum += 10;
          break;
        case >= 70:
          sum += 22 / 3;
          break;
        case >= 65:
          sum += 7;
          break;
        case >= 60:
          sum += 6;
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
