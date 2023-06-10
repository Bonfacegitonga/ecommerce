import 'dart:convert';

import 'package:ecommerce/widgets/itemCard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:grouped_list/grouped_list.dart';

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
    fetchProducts(null);
    fetchCategory();
  }

  List<dynamic> products = [];
  List<dynamic> categories = [];
  String selectedCategory = 'all';

  Future<void> fetchProducts(String? category) async {
    const baseUrl = 'https://fakestoreapi.com';
    final url = category != null
        ? '$baseUrl/products/category/$category'
        : '$baseUrl/products';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() {
        products = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to fetch products');
    }
  }

  Future<void> fetchCategory() async {
    String url = 'https://fakestoreapi.com/products/categories';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        categories = json.decode(response.body);
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
          // const SizedBox(
          //   height: 10,
          // ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(6)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = 'all';
                          });
                          fetchProducts(null);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          child: Text(
                            'all',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: selectedCategory == 'all'
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: selectedCategory == 'all'
                                  ? Colors.orange
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      ...categories.map(
                        (category) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategory = category;
                            });
                            fetchProducts(category);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            child: Text(
                              category.toString(),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: selectedCategory == category
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: selectedCategory == category
                                    ? Colors.orange
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          Expanded(
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
