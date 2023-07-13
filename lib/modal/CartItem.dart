import 'package:ecommerce/modal/products.dart';

class CartItem {
  final Item product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}
