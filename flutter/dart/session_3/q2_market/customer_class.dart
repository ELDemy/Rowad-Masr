import 'product_class.dart';

class Customer {
  static Map<int, Customer> allCustomers = {};
  static int _serialId = 1;

  final int id;
  final String name;
  final Map<Product, int> productsMap = {};

  Customer({required this.name}) : id = _serialId++ {
    allCustomers.addAll({id: this});
  }

  addProduct(Product product, int quantity) {
    if (product.stock >= quantity) {
      product.stock -= quantity;
      product.customersMap[this] = quantity;
      productsMap[product] = quantity;
      return;
    }
    print(
        "Product Code ${product.code}: ${product.name} available ${product.stock} in stock");
    return null;
  }

  addProducts(Map<Product, int> products) {
    products.forEach((product, quantity) {
      addProduct(product, quantity);
    });
  }

  @override
  String toString() {
    // TODO: implement toString
    String products = "";
    productsMap.forEach((product, quantity) {
      products += "$quantity piece of ${product.name}, ";
    });

    return "Customer Id: $id\n"
        "Customer name: $name\n"
        "Ordered Products: $products\n";
  }
}
