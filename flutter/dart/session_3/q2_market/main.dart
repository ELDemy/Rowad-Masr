import 'customer_class.dart';
import 'product_class.dart';

void main() {
  List<Customer> customers = [
    Customer(name: "Mohamed Soliman"),
    Customer(name: "Hussein Sadek"),
    Customer(name: "Ahmed Maher"),
  ];
  List<Product> products = [
    Product(name: "LG TV 65-inch", stock: 5),
    Product(name: "LG Washer 12-kg", stock: 3),
    Product(name: "LG Dryer 8-kg", stock: 8),
    Product(name: "LG TV 43-inch", stock: 2),
    Product(name: "LG Air Conditioner 1.5-hp", stock: 1),
  ];
  Map<int, Product> allProducts = Product.allProducts;
  Map<int, Customer> allCustomers = Customer.allCustomers;

  allCustomers[1]?.addProducts(
    {
      allProducts[1]!: 1,
      allProducts[3]!: 1,
      allProducts[5]!: 1,
    },
  );

  allCustomers[2]?.addProducts(
    {
      allProducts[3]!: 1,
      allProducts[5]!: 1,
    },
  );
  allCustomers[3]?.addProducts(
    {
      allProducts[2]!: 1,
      allProducts[3]!: 1,
      allProducts[4]!: 1,
    },
  );
  for (int customerId in allCustomers.keys) {
    // print(allCustomers[customerId]);
  }
  for (int productCode in allProducts.keys) {
    print(allProducts[productCode]);
  }
}
