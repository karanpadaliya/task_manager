import 'package:flutter/material.dart';

class Book {
  // Private attributes
  String _title;
  String _author;
  double _price;

  // TODO: Constructor REMOVE
  Book(this._title, this._author, this._price);

  // Getters and Setters
  String get title => _title;

  set title(String title) => _title = title;

  String get author => _author;

  set author(String author) => _author = author;

  double get price => _price;

  set price(double price) {
    if (price >= 0) {
      _price = price;
    } else {
      throw ArgumentError('Price cannot be negative');
    }
  }

  @override
  String toString() {
    return 'Title: $_title, Author: $_author, Price: \$$price';
  }
}

class BookPage extends StatefulWidget {
  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  // Create an instance of Book
  final Book _book = Book('Flutter for Beginners', 'Karan Padaliya', 29.99);

  // Controllers for text fields
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with book details
    _titleController.text = _book.title;
    _authorController.text = _book.author;
    _priceController.text = _book.price.toString();
  }

  void _updateBook() {
    setState(() {
      _book.title = _titleController.text;
      _book.author = _authorController.text;
      _book.price = double.tryParse(_priceController.text) ?? _book.price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                """1) Create a Dart class that represents a Book with attributes title, author, and price. Use encapsulation to make these attributes private and provide public methods to access and modify them.""",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: _authorController,
                decoration: InputDecoration(labelText: 'Author'),
              ),
              TextField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _updateBook,
                child: Text('Update Book'),
              ),
              SizedBox(height: 20),
              Text('Book Details:'),
              Text('Title: ${_book.title}'),
              Text('Author: ${_book.author}'),
              Text('Price: \$${_book.price}'),
            ],
          ),
        ),
      ),
    );
  }
}