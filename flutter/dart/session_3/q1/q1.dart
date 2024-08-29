class Student {
  static int serialNumber = 1;
  final int registrationNumber = serialNumber++;

  String _name;
  String _major;
  double _gpa;

  Student({required String name, required String major, required double gpa})
      : _gpa = gpa,
        _major = major,
        _name = name;

  set setName(String name) {
    _name = name;
  }

  set setMajor(String major) {
    _major = major;
  }

  set setGPA(double gpa) {
    _gpa = gpa;
  }
}
