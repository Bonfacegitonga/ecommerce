import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String productCost;
  final Function onClick;
  final Function onAddToCart;
  final String rate;
  final String isInCart;
  // ignore: use_key_in_widget_constructors
  const ItemCard({
    Key? key,
    required this.imageUrl,
    required this.productName,
    required this.onClick,
    required this.productCost,
    required this.rate,
    required this.onAddToCart,
    required this.isInCart,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                  margin: const EdgeInsets.only(bottom: 10, top: 10),
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      // borderRadius: const BorderRadius.only(
                      //     topLeft: Radius.circular(10),
                      //     topRight: Radius.circular(10)),
                      color: Colors.white,
                      image: DecorationImage(
                          image: NetworkImage(imageUrl), fit: BoxFit.contain))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text(
                  productName.length > 20
                      ? '${productName.substring(0, 20)}...'
                      : productName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("ksh $productCost",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 16,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        rate,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                onAddToCart();
              },
              child: Container(
                width: double.infinity,
                height: 25,
                margin: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                  color: Colors.orange,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.45),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                    child: Text(
                  isInCart,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
