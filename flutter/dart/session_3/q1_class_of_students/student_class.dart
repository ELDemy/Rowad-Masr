class Student {
  static int _serialNumber = 1;
  final int registrationNumber = _serialNumber++;

  String _name;
  String _major;
  double _gpa;

  Student({required String name, required String major, required double gpa})
      : _gpa = gpa,
        _major = major,
        _name = name;

  get name => _name;
  get major => _major;
  get gpa => _gpa;

  set setName(String? name) {
    if (name != null && name != "") _name = name;
  }

  set setMajor(String? major) {
    if (major != null && major != "") _major = major;
  }

  set setGPA(double? gpa) {
    if (gpa != null && gpa <= 4) _gpa = gpa;
  }

  @override
  String toString() {
    return "Student Name: $_name\n"
        "Registration Number: $registrationNumber\n"
        "Major: $_major\n"
        "GPA: $_gpa\n";
  }
}
