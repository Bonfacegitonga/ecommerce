import 'package:flutter/material.dart';

import '../utils/api.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List<dynamic> categories = [];
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    try {
      List<dynamic> fetchedCategories = await Api.fetchCategory();
      setState(() {
        categories = fetchedCategories;
      });
    } catch (e) {
      //print('Error fetching categories: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Product Categories'),
        // ),
        body: ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return ListTile(
          title: Text(category),
          onTap: () {},
          trailing: IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
            onPressed: () {},
          ),
        );
      },
    ));
  }
}
