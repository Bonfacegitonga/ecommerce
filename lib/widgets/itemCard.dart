import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String productCost;
  final Function onClick;
  // ignore: use_key_in_widget_constructors
  const ItemCard({
    Key? key,
    required this.imageUrl,
    required this.productName,
    required this.onClick,
    required this.productCost,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      shadowColor: Colors.black,
      elevation: 5,
      child: InkWell(
        onTap: () {
          onClick();
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      color: Colors.white,
                      image: DecorationImage(
                          image: NetworkImage(imageUrl), fit: BoxFit.fill))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  productName.length > 20
                      ? '${productName.substring(0, 20)}...'
                      : productName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  )),
            ),
            Text(productCost,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
