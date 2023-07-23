import 'package:flutter/material.dart';

class OrderContainer extends StatelessWidget {
  final Map<String, dynamic> order;
  const OrderContainer({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    final userEmail = order['user'];
    final products = order['products'];

    double calculateTotal(List<Map<String, dynamic>> products) {
      double total = 0;

      for (var product in products) {
        int itemNo = product['itemNO'];
        int price = product['price'];
        int productTotal = itemNo * price;
        total += productTotal;
      }

      return total;
    }

    double total = calculateTotal(products);

    return Container(
      margin: const EdgeInsets.only(top: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1),
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.orange,
                border: Border(bottom: BorderSide(width: 0.5))),
            child: ListTile(
              title: Text(
                userEmail,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          ListView.builder(
              itemCount: products.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, index) {
                final product = products[index];
                final itemNo = product['itemNO'];
                final itemName = product['item'];
                final price = product['price'];
                return ListTile(
                    leading: Text("$itemNo x"),
                    title: Text(itemName),
                    trailing: Text(price.toString()));
              }),
          Container(
            width: double.maxFinite,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                border: const Border(top: BorderSide(width: 0.5))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                    padding: EdgeInsets.all(9.0),
                    child: Text(
                      "Total",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Text(
                      "Ksh ${total.toString()}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
