import 'classes/full_name_class.dart';
import 'classes/post_graduate_class.dart';
import 'classes/student_abstract_class.dart';
import 'classes/undergraduate_class.dart';

void main() {
  Undergraduate undergraduateStudent = Undergraduate(
    registrationNumber: 15,
    fullName: FullName(
        firstName: "Mahmoud", middleName: "Mostafa", surName: "ELDemerdash"),
    marks: [90, 10, 99, 95, 80, 90, 60, 50, 10, 20],
  );

  Student postGraduateStudent = PostGraduate(
    registrationNumber: 20,
    fullName:
        FullName(firstName: "Mohamed", middleName: "Ali", surName: "Abo elela"),
    marks: [70, 80, 90, 60, 50, 10, 20, 30, 40, 50],
  );
  undergraduateStudent.printInfo();
  print('');
  postGraduateStudent.printInfo();
}
