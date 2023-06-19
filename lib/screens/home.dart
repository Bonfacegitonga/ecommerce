import 'package:flutter/material.dart';

import '../widgets/cartItem.dart';
import 'account.dart';
import 'categories.dart';
import 'feed.dart';
import 'help.dart';
import 'homepage.dart';
import 'product.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    MyHomepage(),
    // ProductPage(),
    MyCart(),
    Account(),
    Help()
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        actions: [
          SearchBar(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            overlayColor: MaterialStateProperty.all(Colors.white),
            constraints: const BoxConstraints(maxWidth: 310, maxHeight: 40),
          ),
          const SizedBox(
            width: 5,
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                size: 40,
              ))
        ],
      ),
      body: _widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.category),
          //   label: "categories",
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration),
            label: "Feed",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: "Account",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: "Help",
          ),
        ],
      ),
    );
  }
}
