import 'package:ecommerce/admin/pendingOrders.dart';
import 'package:ecommerce/admin/productChart.dart';
import 'package:ecommerce/widgets/myContainer.dart';
import 'package:flutter/material.dart';

class ProductOut extends StatefulWidget {
  const ProductOut({super.key});

  @override
  State<ProductOut> createState() => _ProductOutState();
}

class _ProductOutState extends State<ProductOut> {
  List<dynamic> containerItems = [
    {
      'name': 'Today sales',
      'icon': Icons.monetization_on,
      'number': 'Kes 2504',
      'color': const [
        Color.fromARGB(255, 63, 9, 170),
        Color.fromARGB(255, 194, 8, 204),
      ]
    },
    {
      'name': 'Pending Orders',
      'icon': Icons.analytics,
      'number': '106',
      'color': const [
        Color.fromARGB(255, 63, 9, 170),
        Color.fromARGB(255, 204, 8, 8),
      ]
    },
    {
      'name': 'Stock Available',
      'icon': Icons.analytics,
      'number': '150',
      'color': const [
        Color.fromARGB(255, 63, 9, 170),
        Color.fromARGB(255, 204, 191, 8),
      ]
    },
    {
      'name': 'Today Order',
      'icon': Icons.monetization_on,
      'number': 'Kes 5000',
      'color': const [
        Color.fromARGB(255, 63, 9, 170),
        Color.fromARGB(255, 204, 103, 8),
      ]
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Expanded(
              child: GridView.builder(
                  itemCount: containerItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // childAspectRatio: .90,
                      mainAxisSpacing: 7,
                      crossAxisSpacing: 7),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (containerItems[index]['name'] == 'Pending Orders') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PendingOrders()));
                        } else {
                          null;
                        }
                      },
                      child: MyContainer(
                          // width: 180,
                          height: 90,
                          color: containerItems[index]['color'],
                          myIcon: Icon(
                            containerItems[index]['icon'],
                            color: Colors.white,
                          ),
                          text: containerItems[index]['name'],
                          analytics: containerItems[index]['number']),
                    );
                  })),
          const Text(
            "Order overview",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const MyChart()
        ]),
      ),
    );
  }
}
