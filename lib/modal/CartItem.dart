import 'package:localstore/localstore.dart';

class CartItems {
  final String id;
  String title;
  DateTime time;
  final String imageUrl;
  double price;
  bool done;
  CartItems({
    required this.id,
    required this.title,
    required this.time,
    required this.done,
    required this.imageUrl,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'time': time.millisecondsSinceEpoch,
      'done': done,
      'price': price,
      'imageUrl': imageUrl
    };
  }

  factory CartItems.fromMap(Map<String, dynamic> map) {
    return CartItems(
      id: map['id'],
      title: map['title'],
      time: DateTime.fromMillisecondsSinceEpoch(map['time']),
      done: map['done'],
      imageUrl: map['imageUrl'],
      price: map['price'],
    );
  }
}

extension ExtTodo on CartItems {
  Future save() async {
    final db = Localstore.instance;
    return db.collection('myCart').doc(id).set(toMap());
  }

  Future delete() async {
    final db = Localstore.instance;
    return db.collection('myCart').doc(id).delete();
  }
}
