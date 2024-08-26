import 'client_class.dart';

class Account {
  static int _nextNumber = 90001;

  late final int number;
  final String type;
  double balance;
  String currency;
  Client client;
  Account(
      {required this.client,
      required this.type,
      required this.balance,
      required this.currency})
      : number = _nextNumber++;
}
