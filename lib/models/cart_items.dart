import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final String description;
  final String color;
  final String imageUrl;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.description,
    @required this.color,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get cartTotal {
    var total = 0.0;
    _items.forEach((key, product) {
      total += product.price * product.quantity;
    });
    return total;
  }

  void addItem(
    String productId,
    String title,
    String description,
    String color,
    String imageUrl,
    double price,
  ) {
    if (_items.containsKey(productId)) {
      // change quantity...
      _items.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          description: existingCartItem.description,
          color: existingCartItem.color,
          imageUrl: existingCartItem.imageUrl,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: productId,
          title: title,
          description: description,
          color: color,
          imageUrl: imageUrl,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String itemId) {
    _items.remove(itemId);
    notifyListeners();
  }

  void emptyCart() {
    _items = {};
    notifyListeners();
  }

  void decreaseItem(String itemId) {
    if (_items[itemId].quantity > 1) {
      _items.update(
        itemId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          description: existingCartItem.description,
          color: existingCartItem.color,
          imageUrl: existingCartItem.imageUrl,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity - 1,
        ),
      );
    } else {}
    notifyListeners();
  }

  void increaseItem(String itemId) {
    if (_items.containsKey(itemId)) {
      _items.update(
        itemId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          description: existingCartItem.description,
          color: existingCartItem.color,
          imageUrl: existingCartItem.imageUrl,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + 1,
        ),
      );
    }
    notifyListeners();
  }
}
