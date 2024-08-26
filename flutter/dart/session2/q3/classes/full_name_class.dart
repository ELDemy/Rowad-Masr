class FullName {
  final String firstName;
  final String middleName;
  final String surName;

  FullName({
    required this.firstName,
    required this.middleName,
    required this.surName,
  });

  String get() {
    return "First Name: $firstName\n"
        "Middle Name: $middleName\n"
        "surname: $surName";
  }
}
