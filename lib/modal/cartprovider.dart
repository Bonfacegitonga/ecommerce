import 'package:ecommerce/modal/products.dart';
import 'package:flutter/foundation.dart';
import 'package:localstore/localstore.dart';

import 'CartItem.dart';

class ItemsProvider extends ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  int get cartItemCount => _cartItems.length;

  double get totalPrice {
    double total = 0.0;
    for (var item in _cartItems) {
      total += item.product.price * item.quantity;
    }
    return total;
  }

  Future<void> fetchCartItems() async {
    final db = Localstore.instance;
    try {
      final snapshot = await db.collection('myCart').get();
      _cartItems = snapshot!.entries
          .map((entry) => CartItem(product: Item.fromJson(entry.value)))
          .toList();
      notifyListeners();
    } catch (error) {
      // Handle the error
    }
  }

  Future<void> addToCart(Item product) async {
    final db = Localstore.instance;
    final existingIndex =
        _cartItems.indexWhere((item) => item.product.id == product.id);
    if (existingIndex != -1) {
      _cartItems[existingIndex].quantity++;
    } else {
      _cartItems.add(CartItem(product: product));
      await db
          .collection('myCart')
          .doc(product.id.toString())
          .set(product.toMap());
      await product.save();
    }
    notifyListeners();
  }

  Future<void> removeFromCart(Item product) async {
    final existingIndex =
        _cartItems.indexWhere((item) => item.product.id == product.id);
    if (existingIndex != -1) {
      if (_cartItems[existingIndex].quantity > 1) {
        _cartItems[existingIndex].quantity--;
      } else {
        _cartItems.removeAt(existingIndex);
        await product.delete();
      }
      notifyListeners();
    }
  }
}
