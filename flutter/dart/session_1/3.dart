/*
3.
Write a program that prints the diameter, area, and circumference of a circle
whose radius is 5.25 cm. Use the constant value 3.14 for pi (It).
area = m2
Hint: diameter= 2r
circumference = 2m-
 */

class Circle {
  static const Pi = 3.14;

  final double radius;
  Circle({required this.radius});

  double area() {
    return Pi * radius * radius;
  }

  double diameter() {
    return 2 * radius;
  }

  double circumference() {
    return 2 * Pi * radius;
  }
}
