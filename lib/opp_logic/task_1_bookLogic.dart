class Book {
  // Private attributes
  String _title;
  String _author;
  double _price;

  Book(this._title, this._author, this._price);

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