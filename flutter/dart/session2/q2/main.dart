import 'classes/account_class.dart';
import 'classes/client_class.dart';

void main() {
  Client client = Client(
      name: "Younes", age: 2, phoneNumber: "01097662212", address: "Belbeis");

  //there is two methods to add a new account:
  //#1
  Account(client: client, type: "Current", balance: 25000, currency: "EGP");
  // #2
  client.newAccount(
      Account(client: client, type: "Saving", balance: 1800, currency: "USD"));
//

  Account? egpAccount = client.getAccount(90001);
  egpAccount?.deposit(1500);

  Account? usdAccount = client.getAccount(90002);
  usdAccount?.withdraw(5000);
  usdAccount?.withdraw(500);
}
