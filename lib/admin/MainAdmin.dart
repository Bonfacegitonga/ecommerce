import 'package:ecommerce/admin/productOut.dart';
import 'package:ecommerce/modal/products.dart';
import 'package:ecommerce/widgets/myContainer.dart';
import 'package:flutter/material.dart';

import '../utils/api.dart';
import 'addProduct.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  List<Item> myProducts = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchProductsData("jewelery");
  }

  Future<void> fetchProductsData(String? category) async {
    setState(() {
      isLoading = true;
    });
    try {
      final fetchedProducts = await Api.fetchProducts(category);
      setState(() {
        myProducts = fetchedProducts;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("STOCK ANALYTICS"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const MyContainer(color: [
                Color.fromARGB(255, 63, 9, 170),
                Color.fromARGB(255, 194, 8, 204),
              ], text: "Product In", analytics: "208"),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProductOut()));
                },
                child: const MyContainer(color: [
                  Color.fromARGB(255, 146, 5, 123),
                  Color.fromARGB(255, 233, 155, 9),
                ], text: "Product Out", analytics: "176"),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              width: double.maxFinite,
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(0.8, 1),
                  colors: <Color>[
                    Color(0xff870160),
                    Color(0xffac255e),
                    Color(0xffca485c),
                    Color(0xffe16b5c),
                    Color(0xfff39060),
                  ],
                  tileMode: TileMode.mirror,
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddProductScreen()));
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle_outline_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Add Product",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Available product list",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: myProducts.length,
                itemBuilder: (context, index) {
                  final product = myProducts[index];
                  return Container(
                    margin: const EdgeInsets.only(top: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Image.network(
                            product.imageurl,
                            width: 60,
                          ),
                          title: Text(
                            product.title.length > 30
                                ? '${product.title.substring(0, 30)}...'
                                : product.title,
                          ),
                          subtitle: Text('Ksh ${product.price.toString()}'),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.mode_edit_outlined,
                              color: Colors.orange,
                              size: 33,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 77,
                          decoration: const BoxDecoration(
                              border: Border(top: BorderSide(width: 0.5))),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(
                                  9.0,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "70 Pcs",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "In Stock",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(9.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "120 Pcs",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: 1,
                                    ),
                                    Text(
                                      "Last Restocked",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ))
        ],
      ),
    );
  }
}
