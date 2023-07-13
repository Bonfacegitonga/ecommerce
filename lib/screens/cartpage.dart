import 'package:flutter/material.dart';
import 'package:localstore/localstore.dart';
import 'package:provider/provider.dart';
import '../modal/cartprovider.dart';
import '../modal/products.dart';
import '../widgets/cartItem.dart';
import 'home.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final _db = Localstore.instance;
  final _items = <String, Item>{};
  ItemsProvider itemsProvider = ItemsProvider();

  @override
  void initState() {
    itemsProvider.fetchCartItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ItemsProvider>(context, listen: true).fetchCartItems();
    final cartProvider = Provider.of<ItemsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black54,
        //centerTitle: true,
        actions: [
          cartProvider.cartItemCount == 0
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
          cartProvider.cartItemCount == 0
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
                    "Ksh ${cartProvider.totalPrice}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
          const SizedBox(
            height: 5,
          ),
          cartProvider.cartItemCount == 0
              ? const SizedBox()
              : Container(
                  //margin: const EdgeInsets.only(top: 5),
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(color: Colors.grey[100]),
                  child: Text(
                    "Cart (${cartProvider.cartItems.length.toString()})",
                    style: TextStyle(color: Colors.grey[900]),
                  )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: ListView.builder(
                  itemCount: cartProvider.cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartProvider.cartItems[index];
                    //final key = _items.keys.elementAt(index);
                    // final item = _items[key]!;
                    return MyCart(
                      imageUrl: cartItem.product.imageurl,
                      name: cartItem.product.title,
                      price: cartItem.product.price.toString(),
                      onPress: () {
                        cartProvider.removeFromCart(cartItem.product);
                      },
                    );
                  }),
            ),
          ),
          Wrap(
            spacing: 10,
            children: [
              cartProvider.cartItemCount == 0
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
                  cartProvider.cartItemCount == 0
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
                            cartProvider.cartItemCount == 0
                                ? "START SHOPPING"
                                : "CHECKOUT ${cartProvider.totalPrice == 0.0 ? '' : 'KSH ${cartProvider.totalPrice}'}",
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
