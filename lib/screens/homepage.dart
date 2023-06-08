import 'dart:convert';

import 'package:ecommerce/widgets/itemCard.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  List<dynamic> products = [];

  Future<void> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      setState(() {
        products = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to fetch products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: OrientationBuilder(builder: (context, orientation) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          orientation == Orientation.portrait ? 2 : 3,
                      childAspectRatio: .82,
                      mainAxisSpacing: 7,
                      crossAxisSpacing: 7),
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    final product = products[index];
                    return ItemCard(
                        imageUrl: product['image'],
                        productName: product['title'],
                        onClick: () {},
                        productCost: product['price'].toString());
                  });
            }),
          ),
        ],
      ),
    );
  }
}
