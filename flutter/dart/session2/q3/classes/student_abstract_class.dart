import 'full_name_class.dart';
import 'student_event_abstract_class.dart';

abstract class Student implements StudentEvent {
  final int registrationNumber;
  final FullName fullName;
  List<double> marks;
  double? GPA;

  Student({
    required this.registrationNumber,
    required this.fullName,
    required this.marks,
  });

  @override
  void printInfo() {
    print(
      "Registration Number: $registrationNumber\n"
      "${fullName.get()}\n"
      "marks:$marks",
    );
  }
}
