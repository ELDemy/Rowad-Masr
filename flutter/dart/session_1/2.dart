/*
2. Write a program that calculates and prints the area and perimeter ofa rectangle
whose width is 4 cm and its height is 6 cm.
perimeter = 2 (width + height)
Hint: area = width x height
*/
class Rectangle {
  final double height;
  final double width;

  Rectangle({required this.height, required this.width});

  double area() {
    return height * width;
  }

  double perimeter() {
    return 2 * (width + height);
  }
}
