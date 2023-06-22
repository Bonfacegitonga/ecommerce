import 'package:flutter/material.dart';

class MyCart extends StatelessWidget {
  final String imageUrl;
  final String price;
  final String name;
  final Function onPress;
  const MyCart(
      {super.key,
      required this.imageUrl,
      required this.onPress,
      required this.price,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Wrap(
        children: [
          Row(
            children: [
              SizedBox(
                width: 180,
                height: 180,
                child: Container(
                    margin:
                        const EdgeInsets.only(bottom: 10, top: 10, left: 10),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        //     topLeft: Radius.circular(10),
                        //     topRight: Radius.circular(10)),
                        color: Colors.white,
                        image: DecorationImage(
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.contain))),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                alignment: Alignment.center,
                width: 150,
                child: Column(
                  //direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(name,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400))),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text("ksh $price",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        onPress();
                      },
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.orange,
                      )),
                  const SizedBox(
                    width: 1,
                  ),
                  const Text(
                    "REMOVE",
                    style: TextStyle(
                        color: Colors.orange, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        color: Colors.orange),
                    child: const Center(
                        child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    )),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Container(
                    width: 35,
                    height: 35,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        color: Colors.white),
                    child: const Center(child: Text("1")),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 6),
                    width: 35,
                    height: 35,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        color: Colors.orange),
                    child: const Center(
                        child: Icon(
                      Icons.add,
                      color: Colors.white,
                    )),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
