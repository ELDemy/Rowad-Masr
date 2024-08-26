import 'classes/client_class.dart';

void main() {
  Client client = Client(
      name: "Younes", age: 2, phoneNumber: "01097662212", address: "Belbeis");
  print(client.number);
  client.newAccount(type: "Saving ", balance: 150, currency: "USD");

  print(client.accountsList[0].client.address);
}
