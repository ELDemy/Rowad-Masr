import 'account_class.dart';

class Client {
  static int _nextNumber = 10001;

  late final int number;
  String name;
  int age;
  String phoneNumber;
  String address;
  final Map<int, Account> _accountsMap = {};

  Client({
    required this.name,
    required this.age,
    required this.phoneNumber,
    required this.address,
  }) : number = _nextNumber++;

  newAccount(Account account) {
    _accountsMap.addAll({account.number: account});
  }

  Account? getAccount(int accountNumber) {
    Account? account = _accountsMap[accountNumber];
    if (account != null) {
      return account;
    } else {
      print("Account number $accountNumber is not found");
      return null;
    }
  }
}
