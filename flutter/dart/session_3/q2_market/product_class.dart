import 'customer_class.dart';

class Product {
  static Map<int, Product> allProducts = {};
  static int _serialCode = 1;

  final int code;
  final String name;
  int stock;

  final Map<Customer, int> customersMap = {};

  Product({required this.name, required this.stock}) : code = _serialCode++ {
    allProducts[code] = this;
  }

  void addCustomer(Customer customer, int quantity) {
    customer.addProduct(this, quantity);
  }

  void addCustomers(Map<Customer, int> customerProductMap) {
    customerProductMap.forEach((customer, quantity) {
      addCustomer(customer, quantity);
    });
  }

  @override
  String toString() {
    String customers = "";
    customersMap.forEach((customer, quantity) {
      customers += "${customer.name} with $quantity pieces\n";
    });

    return "Product code: $code\n"
        "Product Name: $name\n"
        "Product Stock: $stock\n"
        "Customers for this product:\n$customers";
  }
}
