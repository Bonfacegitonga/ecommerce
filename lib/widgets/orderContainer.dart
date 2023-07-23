import 'package:flutter/material.dart';

class OrderContainer extends StatelessWidget {
  final List items;
  final String total;
  final String itemTitle;
  final String itemNo;
  final String price;
  const OrderContainer(
      {super.key,
      required this.items,
      required this.total,
      required this.itemTitle,
      required this.itemNo,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1),
      ),
      child: Column(
        children: [
          ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                    leading: Text("$itemNo x"),
                    title: Text(itemTitle),
                    trailing: Text(price));
              }),
          Container(
            width: double.maxFinite,
            height: 40,
            decoration: const BoxDecoration(
                border: Border(top: BorderSide(width: 0.5))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                    padding: EdgeInsets.all(9.0), child: Text("Total")),
                Padding(padding: const EdgeInsets.all(9.0), child: Text(total))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
