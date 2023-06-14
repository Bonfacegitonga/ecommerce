import 'package:flutter/material.dart';

import '../utils/api.dart';

class Categories extends StatefulWidget {
  //final VoidCallback callback;
  const Categories({
    super.key,
  });

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<dynamic> categories = [];

  @override
  void initState() {
    // Api.fetchCategory(categories);
    super.initState();
    fetchData();
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
      body: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            height: double.maxFinite,
            width: 125,
            decoration: const BoxDecoration(color: Colors.green),
            child: Column(children: [
              Expanded(
                child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      final category = categories[index];
                      return ListTile(
                        title: Text(category.toString()),
                      );
                    }),
              ),
            ]),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(5),
              height: double.maxFinite,
              width: 30,
              decoration: const BoxDecoration(color: Colors.yellow),
            ),
          ),
        ],
      ),
    );
  }
}
