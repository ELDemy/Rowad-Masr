/*
Write a program that calculates the sum, average and product of four integers
(12, 15, 13, 3). The output console should display the result as follows:
Sum is 43
Average is 10.75
Product is 7020
*/

/*
4.
Write a program that calculates and prints both the arithmetic and the harmonic
mean, Of the two integers x and y, where x=12 and y—13.
2
Harmonic mean =
Arithmetic mean =
2
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

  double harmonicMean({required int number1Index, required int number2Index}) {
    int n1 = numbersList[number1Index];
    int n2 = numbersList[number2Index];
    return 2 / ((1 / n1) + (1 / n2));
  }

  double arithmeticMean(
      {required int number1Index, required int number2Index}) {
    int n1 = numbersList[number1Index];
    int n2 = numbersList[number2Index];
    return (n1 + n2) / 2;
  }
}
