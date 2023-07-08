import 'package:ecommerce/modal/products.dart';
import 'package:localstore/localstore.dart';

class CartItem {
  final Item product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

























// import 'package:ecommerce/modal/products.dart';
// import 'package:localstore/localstore.dart';

// class CartItems {
//   final Item item;
//   // final String id;
//   // String title;
//   // DateTime time;
//   // final String imageUrl;
//   // double price;
//   // bool done;
//   CartItems({
//     required this.item
//     // required this.id,
//     // required this.title,
//     // required this.time,
//     // required this.done,
//     // required this.imageUrl,
//     // required this.price,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'id': item.id,
//       'title': item.title,
//       //'time': time.millisecondsSinceEpoch,
//       'done': item.isAddedToCart,
//       'price': item.price,
//       'imageUrl': item.imageurl
//     };
//   }

//   factory CartItems.fromMap(Map<String, dynamic> map) {
//     return CartItems(
//       // id: map['id'],
//       // title: map['title'],
//       // time: DateTime.fromMillisecondsSinceEpoch(map['time']),
//       // done: map['done'],
//       // imageUrl: map['imageUrl'],
//       // price: map['price'], 
//       item: null,
//     );
//   }
// }

// extension ExtTodo on CartItems {
//   Future save() async {
//     final db = Localstore.instance;
//     return db.collection('myCart').doc(item.id.toString()).set(toMap());
//   }

//   Future delete() async {
//     final db = Localstore.instance;
//     return db.collection('myCart').doc(item.id.toString()).delete();
//   }
// }
