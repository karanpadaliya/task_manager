import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  // Create a list of products
  final List<Product> _products = [
    Product('1', 'Product A', 29.99),
    Product('2', 'Product B', 59.99),
    Product('3', 'Product C', 19.99),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              """4) Create a Flutter application that includes a class Product with private attributes id, name, and price. Use getters and setters to access and modify these attributes. Display a list of products on the screen.
""",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  final product = _products[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(product.name),
                      subtitle: Text('ID: ${product.id}'),
                      trailing: Text('\$${product.price.toStringAsFixed(2)}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  // Private attributes
  final String _id;
  String _name;
  double _price;

  // Constructor
  Product(this._id, this._name, this._price);

  // Getter and Setter for id (read-only)
  String get id => _id;

  // Getter and Setter for name
  String get name => _name;

  set name(String newName) => _name = newName;

  // Getter and Setter for price
  double get price => _price;

  set price(double newPrice) {
    if (newPrice >= 0) {
      _price = newPrice;
    } else {
      print('Price cannot be negative.');
    }
  }
}
