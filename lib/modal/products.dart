import 'package:localstore/localstore.dart';

class Item {
  final int id;
  final String title;
  final double price;
  final String imageurl;
  final String description;
  final Rating rating;
  bool isAddedToCart;

  Item({
    required this.imageurl,
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.rating,
    this.isAddedToCart = false,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      imageurl: json['image'],
      title: json['title'],
      description: json['description'],
      rating: Rating.fromJson(json['rating']),
      price: json['price'].toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      //'time': time.millisecondsSinceEpoch,
      'done': isAddedToCart,
      'price': price,
      'imageUrl': imageurl
    };
  }
}

class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'].toDouble(),
      count: json['count'],
    );
  }
}

extension ExtTodo on Item {
  Future save() async {
    final db = Localstore.instance;
    return db.collection('myCart').doc(id.toString()).set(toMap());
  }

  Future delete() async {
    final db = Localstore.instance;
    return db.collection('myCart').doc(id.toString()).delete();
  }
}
