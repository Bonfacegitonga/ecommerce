import 'dart:async';

import 'package:flutter/material.dart';
import 'package:localstore/localstore.dart';

import '../modal/CartItem.dart';
import '../widgets/cartItem.dart';
import 'home.dart';
import 'homepage.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final _db = Localstore.instance;
  final _items = <String, CartItems>{};

  @override
  void initState() {
    _db.collection('myCart').get().then((value) {
      setState(() {
        value?.entries.forEach((element) {
          final item = CartItems.fromMap(element.value);
          _items.putIfAbsent(item.id, () => item);
        });
      });
    });

    // _subscription = _db.collection('myCart').stream.listen((event) {
    //   setState(() {
    //     final item = CartItems.fromMap(event);
    //     _items.putIfAbsent(item.id, () => item);
    //   });
    // });
    print(_items.keys);
    super.initState();
  }

  double calculateTotalSum(Map<String, CartItems> items) {
    double totalSum = 0.0;
    items.values.forEach((item) {
      totalSum += item.price;
    });
    return totalSum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black54,
        //centerTitle: true,
        actions: [
          _items.isEmpty
              ? const SizedBox()
              : IconButton(
                  onPressed: () {
                    setState(() {
                      _db.collection('myCart').delete();
                      _items.clear();
                    });
                  },
                  icon: const Icon(
                    Icons.delete_outlined,
                    color: Colors.orange,
                    size: 30,
                  ),
                )
        ],
      ),
      body: Column(
        children: [
          Container(
            //margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.only(top: 10, left: 20),
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(color: Colors.grey[100]),
            child: Text(
              "Cart Summary",
              style: TextStyle(color: Colors.grey[900]),
            ),
          ),
          _items.isEmpty
              ? Center(
                  child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                        "Your cart is empty!",
                        style: TextStyle(fontSize: 17),
                      )),
                )
              : ListTile(
                  title: const Text(
                    "Subtotal",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text("Delivery fees not included yet"),
                  trailing: Text(
                    "Ksh ${calculateTotalSum(_items).toString()}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
          const SizedBox(
            height: 5,
          ),
          _items.isEmpty
              ? const SizedBox()
              : Container(
                  //margin: const EdgeInsets.only(top: 5),
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(color: Colors.grey[100]),
                  child: Text(
                    "Cart (${_items.keys.length.toString()})",
                    style: TextStyle(color: Colors.grey[900]),
                  )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: ListView.builder(
                  itemCount: _items.keys.length,
                  itemBuilder: (context, index) {
                    final key = _items.keys.elementAt(index);
                    final item = _items[key]!;
                    return MyCart(
                      imageUrl: item.imageUrl,
                      name: item.title,
                      price: item.price.toString(),
                      onPress: () {
                        setState(() {
                          item.delete();
                          _items.remove(item.id);
                        });
                      },
                    );
                  }),
            ),
          ),
          Wrap(
            spacing: 10,
            children: [
              _items.isEmpty
                  ? const SizedBox()
                  : Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 10),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.orange,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(7)),
                      child: const Center(
                        child: Icon(Icons.phone),
                      ),
                    ),
              GestureDetector(
                onTap: () {
                  _items.isEmpty
                      ? Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Home()))
                      : null;
                },
                child: FractionallySizedBox(
                  widthFactor: 0.6,
                  child: Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 10),
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(7)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.shopping_cart_checkout_outlined,
                            color: Colors.white,
                          ),
                          Text(
                            _items.isEmpty
                                ? "START SHOPPING"
                                : "CHECKOUT ${calculateTotalSum(_items) == 0.0 ? '' : 'KSH ${calculateTotalSum(_items).toString()}'}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
