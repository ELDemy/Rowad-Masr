import 'customer_class.dart';

class Product {
  static Map<int, Product> allProducts = {};
  static int _serialCode = 1;

  final int code = _serialCode++;
  final String name;
  int stock;

  Map<Customer, int> customersMap = {};

  Product({required this.name, required this.stock}) {
    allProducts.addAll({code: this});
  }

  void addCustomer(Customer customer, int quantity) {
    customer.addProduct(this, quantity);
  }

  void addCustomers(Map<Customer, int> customersMap) {
    for (Customer customer in customersMap.keys) {
      addCustomer(customer, customersMap[customer]!);
    }
  }

  @override
  String toString() {
    String customers = "";
    for (Customer customer in customersMap.keys) {
      customers += "${customer.name} with ${customersMap[customer]} pieces\n";
    }

    return "Product code: $code\n"
        "Product Name: $name\n"
        "Product Stock: $stock\n"
        "Customers for this product:\n$customers";
  }
}
