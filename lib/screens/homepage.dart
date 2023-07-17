import 'dart:async';

import 'package:ecommerce/screens/product.dart';
import 'package:ecommerce/utils/api.dart';
import 'package:ecommerce/widgets/itemCard.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:localstore/localstore.dart';
import 'package:provider/provider.dart';
import '../modal/cartprovider.dart';
import '../modal/products.dart';

//import 'package:badges/badges.dart' as badges;

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  final _db = Localstore.instance;
  final _items = <String, Item>{};
  List<Item> items = [];

  List<Item> products = [];
  List<dynamic> categories = [];
  String selectedCategory = 'all';
  bool isLoading = false;

  @override
  void initState() {
    // _db.collection('myCart').get().then((value) {
    //   setState(() {
    //     value?.entries.forEach((element) {
    //       final item = Item.fromJson(element.value);
    //       _items.putIfAbsent(item.id.toString(), () => item);
    //     });
    //   });
    // });

    super.initState();
    fetchProductsData(null);
    fetchData();
  }

  Future<void> fetchProductsData(String? category) async {
    setState(() {
      isLoading = true;
    });
    try {
      final fetchedProducts = await Api.fetchProducts(category);
      setState(() {
        products = fetchedProducts;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }

  Future<void> fetchData() async {
    try {
      List<dynamic> fetchedCategories = await Api.fetchCategory();
      setState(() {
        categories = fetchedCategories;
      });
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }

  Future<void> toggleCartItem(int itemId) async {
    final itemIndex = products.indexWhere((item) => item.id == itemId);
    if (itemIndex != -1) {
      final isAddedToCart = products[itemIndex].isAddedToCart;
      setState(() {
        products[itemIndex].isAddedToCart = !isAddedToCart;
      });
    }
  }

  Future addToCart(Item item) async {}

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<ItemsProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(6)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = 'all';
                          });
                          fetchProductsData(null);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(2),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: selectedCategory == 'all'
                                  ? Colors.orange
                                  : Colors.grey),
                          child: Text(
                            'all',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: selectedCategory == 'all'
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      ...categories.map(
                        (category) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategory = category;
                            });
                            fetchProductsData(category);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: selectedCategory == category
                                    ? Colors.orange
                                    : Colors.grey),
                            child: Text(
                              category.toString(),
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: selectedCategory == category
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          // Positioned(child: child)
          // Align()
          isLoading
              ? const Padding(
                  padding: EdgeInsets.all(180.0),
                  child: LoadingIndicator(
                    indicatorType: Indicator.lineSpinFadeLoader,
                    colors: [Colors.amber, Colors.orange, Colors.yellow],
                  ),
                )
              : Expanded(
                  child: OrientationBuilder(builder: (context, orientation) {
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                orientation == Orientation.portrait ? 2 : 3,
                            childAspectRatio: .90,
                            mainAxisSpacing: 7,
                            crossAxisSpacing: 7),
                        itemCount: products.length,
                        itemBuilder: (BuildContext context, int index) {
                          final product = products[index];
                          final isInCart = cartProvider.cartItems
                              .any((item) => item.product.id == product.id);
                          return ItemCard(
                            onAddToCart: () {
                              isInCart
                                  ? cartProvider.removeFromCart(product)
                                  : addToCart(product);
                            },
                            onClick: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProductPage(product: product)));
                            },
                            item: product,
                          );
                        });
                  }),
                ),
        ],
      ),
    );
  }
}
