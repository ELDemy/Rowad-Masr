import 'account_class.dart';

class Client {
  static int _nextNumber = 10001;

  late final int number;
  final String name;
  final int age;
  final String phoneNumber;
  final String address;
  List<Account> accountsList = [];

  Client(
      {required this.name,
      required this.age,
      required this.phoneNumber,
      required this.address})
      : number = _nextNumber++;

  newAccount(
      {required String type,
      required double balance,
      required String currency}) {
    accountsList.add(
      Account(client: this, type: type, balance: balance, currency: currency),
    );
  }
}
