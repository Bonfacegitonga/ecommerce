import 'package:flutter/material.dart';
import 'package:localstore/localstore.dart';

import '../modal/CartItem.dart';
import '../modal/products.dart';
import 'cartpage.dart';

class ProductPage extends StatefulWidget {
  final Item product;
  const ProductPage({super.key, required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final _items = <String, CartItems>{};
  Future addToCart(String id, String title, DateTime time, bool done,
      String imageUrl, double price) async {
    final item = CartItems(
        id: id,
        title: title,
        time: time,
        done: done,
        imageUrl: imageUrl,
        price: price);
    item.save();
    _items.putIfAbsent(item.id, () => item);
  }

  Future deleteFromCart(String id) async {
    final db = Localstore.instance;
    return db.collection('myCart').doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text(
          "Product Details",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          // SearchBar(
          //   backgroundColor: MaterialStateProperty.all(Colors.white),
          //   overlayColor: MaterialStateProperty.all(Colors.white),
          //   constraints: const BoxConstraints(maxWidth: 310, maxHeight: 40),
          // ),
          // const SizedBox(
          //   width: 5,
          // ),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Cart()));
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
                size: 35,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.network(
              widget.product.imageurl,
              fit: BoxFit.contain,
              height: 300,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.product.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("ksh ${widget.product.price}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.orange)),
                        onPressed: () {
                          widget.product.isAddedToCart
                              ? deleteFromCart(widget.product.id.toString())
                              : addToCart(
                                  widget.product.id.toString(),
                                  widget.product.title,
                                  DateTime.now(),
                                  true,
                                  widget.product.imageurl,
                                  widget.product.price.toDouble());
                          setState(() {
                            widget.product.isAddedToCart =
                                !widget.product.isAddedToCart;
                          });
                        },
                        child: Row(
                          children: [
                            Text(
                              widget.product.isAddedToCart
                                  ? "Remove"
                                  : 'Add to cart',
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white),
                            ),
                            const Icon(
                              Icons.shopping_cart,
                              size: 18,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Ratings',
                        style: TextStyle(fontSize: 16),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.amber,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${widget.product.rating.rate.toString()} (${widget.product.rating.count.toString()} users)',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Specifications',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Size: M',
                    style: TextStyle(fontSize: 16),
                  ),
                  const Text(
                    'Color: Red',
                    style: TextStyle(fontSize: 16),
                  ),
                  const Text(
                    'Material: Cotton',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Customer Reviews',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const ListTile(
                    leading: CircleAvatar(
                      child: Text('JD'),
                    ),
                    title: Text('John Doe'),
                    subtitle: Text('Great product! Highly recommended.'),
                  ),
                  const ListTile(
                    leading: CircleAvatar(
                      child: Text('LM'),
                    ),
                    title: Text('Lisa Smith'),
                    subtitle: Text('Good quality and fast shipping.'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
