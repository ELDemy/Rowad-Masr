import 'client_class.dart';

class Account {
  static int _nextNumber = 90001;

  final String type;
  double balance;
  final String currency;
  final Client client;

  late final int number;
  late final String _currencySymbol;

  Account({
    required this.client,
    required this.type,
    required this.balance,
    required this.currency,
  }) {
    number = _nextNumber++;

    switch (currency) {
      case "EGP":
        _currencySymbol = "LE";
      case "USD":
        _currencySymbol = "\$";
      default:
        _currencySymbol = "\$";
    }

    client.newAccount(this);
  }

  deposit(double amount) {
    balance += amount;
    print(
        "Account number $number balance after deposit is: $balance $_currencySymbol");
  }

  withdraw(double amount) {
    if (balance > amount) {
      balance -= amount;
      print(
          "Account number $number balance after withdraw is: $balance $_currencySymbol");
    } else {
      print(
          "Transaction Declined for Account number $number: insufficient balance $balance $_currencySymbol");
    }
  }
}
