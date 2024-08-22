/*
Write a program that calculates the sum, average and product of four integers
(12, 15, 13, 3). The output console should display the result as follows:
Sum is 43
Average is 10.75
Product is 7020
*/
class ListOfNumbers {
  final List<int> numbersList;

  ListOfNumbers({required this.numbersList});

  int sum() {
    int sum = 0;
    for (int n in numbersList) sum += n;
    return sum;
  }

  double average() {
    return sum() / numbersList.length;
  }

  int product() {
    int product = 1;
    for (int n in numbersList) product *= n;
    return product;
  }
}
