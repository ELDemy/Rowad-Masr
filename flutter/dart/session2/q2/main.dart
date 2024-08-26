import 'classes/account_class.dart';
import 'classes/client_class.dart';

void main() {
  Client client = Client(
      name: "Younes", age: 2, phoneNumber: "01097662212", address: "Belbeis");

  //there is two methods to add a new account:
  //#1
  Account(client: client, type: "Current", balance: 25000, currency: "EGP");

  // #2 preferred
  client.newAccount(
      Account(client: client, type: "Saving", balance: 1800, currency: "USD"));

  print(client.getAllAccountsNumbers()); // (90001, 90002)
//

  Account? egpAccount = client.getAccount(accountNumber: 90001);
  egpAccount?.deposit(1500);
  //Account number 90001 balance after deposit is: 26500.0 LE

  Account? usdAccount = client.getAccount(accountNumber: 90002);
  usdAccount?.withdraw(5000);
  //Transaction Declined for Account number 90002: insufficient balance 1800.0 $

  usdAccount?.withdraw(500);
  //Account number 90002 balance after withdraw is: 1300.0 $
  print('');
  client.printDetails();
}
