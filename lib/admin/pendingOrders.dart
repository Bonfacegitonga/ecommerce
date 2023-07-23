import 'package:flutter/material.dart';

class PendingOrders extends StatefulWidget {
  const PendingOrders({super.key});

  @override
  State<PendingOrders> createState() => _PendingOrdersState();
}

class _PendingOrdersState extends State<PendingOrders> {
  List<dynamic> pendingOrders = [
    {
      'user': "bonfaceg@gmail.com",
      'products': [
        {"itemNO": 2, "item": "Usb flash disk", "price": 1500},
        {"itemNO": 1, "item": "Laptop bag", "price": 2500}
      ]
    },
    {
      'user': "jsong@gmail.com",
      'products': [
        {"itemNO": 2, "item": "Dell monitor", "price": 11500},
        {"itemNO": 2, "item": "Leather jacket", "price": 3500}
      ]
    },
    {
      'user': "paggie@gmail.com",
      'products': [
        {"itemNO": 2, "item": "Dell monitor", "price": 11500},
        {"itemNO": 2, "item": "Leather jacket", "price": 3500}
      ]
    },
    {
      'user': "janedoeg@gmail.com",
      'products': [
        {"itemNO": 2, "item": "Usb flash disk", "price": 1500},
        {"itemNO": 1, "item": "Laptop bag", "price": 2500}
      ]
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pending Orders"),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
