import 'product_class.dart';

class Customer {
  static Map<int, Customer> allCustomers = {};
  static int _serialId = 1;
  final int id = _serialId++;
  final String name;
  Map<Product, int> productsList = {};

  Customer({required this.name}) {
    allCustomers.addAll({id: this});
  }

  addProduct(Product product, int quantity) {
    if (product.stock >= quantity) {
      product.stock -= quantity;
      product.customersMap.addAll({this: quantity});
      productsList.addAll({product: quantity});
      return;
    }
    print(
        "Product Code ${product.code}: ${product.name} available ${product.stock} in stock");
    return null;
  }

  addProducts(Map<Product, int> products) {
    for (Product product in products.keys) {
      addProduct(product, products[product]!);
    }
  }

  @override
  String toString() {
    // TODO: implement toString
    String products = "";
    for (Product product in productsList.keys) {
      products += "${productsList[product]} piece of ${product.name}, ";
    }

    return "Customer Id: $id\n"
        "Customer name: $name\n"
        "Ordered Products: $products\n";
  }
}
