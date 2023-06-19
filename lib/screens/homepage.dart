import 'package:ecommerce/screens/product.dart';
import 'package:ecommerce/utils/api.dart';
import 'package:ecommerce/widgets/itemCard.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  List<dynamic> products = [];
  List<dynamic> categories = [];
  String selectedCategory = 'all';
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    fetchProductsData(null);
    fetchData();
  }

  Future<void> fetchProductsData(String? category) async {
    setState(() {
      isLoading = true;
    });
    try {
      List<dynamic> fetchedProducts = await Api.fetchProducts(category);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                          fetchProductsData(null);
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
                            fetchProductsData(category);
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
                          return ItemCard(
                            imageUrl: product['image'],
                            productName: product['title'],
                            onClick: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProductPage(product: product)));
                            },
                            productCost: product['price'].toString(),
                            rate: product['rating']['rate'].toString(),
                          );
                        });
                  }),
                ),
        ],
      ),
    );
  }
}
