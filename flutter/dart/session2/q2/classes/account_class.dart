import 'client_class.dart';

class Account {
  static int _nextUniqueNumber = 90001;
  final int number = _nextUniqueNumber++;

  final String type;
  double balance;
  final String currency;
  final Client client;

  late final String _currencySymbol;

  Account({
    required this.client,
    required this.type,
    required this.balance,
    required this.currency,
  }) {
    switch (currency) {
      case "EGP":
        _currencySymbol = "LE";
        break;
      case "USD":
        _currencySymbol = "\$";
        break;
      default:
        _currencySymbol = "\$";
        break;
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

  void printDetails() {
    print(
      "Account Number: $number\n"
      "Account Type: $type\n"
      "Account Currency: $currency\n"
      "Balance: $balance\n",
    );
  }
}
