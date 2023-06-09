import 'package:flutter/material.dart';
import 'package:localstore/localstore.dart';
import 'package:provider/provider.dart';

import '../admin/MainAdmin.dart';
import '../modal/cartprovider.dart';
import '../widgets/cartItem.dart';
import 'account.dart';
import 'cartpage.dart';
import 'categories.dart';
import 'feed.dart';
import 'help.dart';
import 'homepage.dart';
import 'product.dart';
import 'package:badges/badges.dart' as badges;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  bool itemAdmin = false;

  @override
  void initState() {
    super.initState();
  }

  static const List<Widget> _widgetOptions = <Widget>[
    MyHomepage(),
    // ProductPage(),
    CategoriesPage(),
    Account(),
    Help(),
    Admin()
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      itemAdmin = _widgetOptions[index] is Admin;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<ItemsProvider>(context);

    return Scaffold(
      appBar: itemAdmin
          ? null
          : AppBar(
              backgroundColor: Colors.black54,
              actions: [
                SearchBar(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  overlayColor: MaterialStateProperty.all(Colors.white),
                  constraints:
                      const BoxConstraints(maxWidth: 310, maxHeight: 40),
                ),
                const SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, right: 15),
                  child: Consumer<ItemsProvider>(
                      builder: (context, cartItemsProvider, child) {
                    int cartitemCount = cartProvider.cartItemCount;
                    return badges.Badge(
                      badgeContent: Text(cartitemCount.toString()),
                      badgeStyle: const badges.BadgeStyle(
                        badgeColor: Colors.white,
                        elevation: 0,
                      ),
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Cart()));
                          },
                          icon: const Icon(
                            Icons.shopping_cart_outlined,
                            size: 35,
                            color: Colors.white,
                          )),
                    );
                  }),
                ),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: "Account",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: "Help",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings),
            label: "Admin",
          ),
        ],
      ),
    );
  }
}
