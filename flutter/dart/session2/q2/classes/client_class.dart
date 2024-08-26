import 'account_class.dart';

class Client {
  static int _nextUniqueNumber = 10001;
  final int number = _nextUniqueNumber++;

  final String name;
  int age;
  String phoneNumber;
  String address;
  final Map<int, Account> _accountsMap = {};

  Client({
    required this.name,
    required this.age,
    required this.phoneNumber,
    required this.address,
  });

  newAccount(Account account) {
    _accountsMap.addAll({account.number: account});
  }

  Account? getAccount({required int accountNumber}) {
    Account? account = _accountsMap[accountNumber];

    if (account != null)
      return account;
    else
      print("Account number $accountNumber is not found");
    return null;
  }

  Iterable<int> getAllAccountsNumbers() {
    return _accountsMap.keys;
  }

  void printDetails() {
    print(
      "Client Number: $number\n"
      "Client Name: $name\n"
      "Client age:$age\n"
      "Client phoneNumber: $phoneNumber\n"
      "Client address: $address\n",
    );
    for (Account account in _accountsMap.values) account.printDetails();
  }
}
