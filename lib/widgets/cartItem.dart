import 'package:flutter/material.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
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
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        //     topLeft: Radius.circular(10),
                        //     topRight: Radius.circular(10)),
                        color: Colors.white,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
                            fit: BoxFit.contain))),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                alignment: Alignment.center,
                width: 100,
                child: Column(
                  //direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                            "bag dfggshdsfghgs ahsdgshfgcccxcsdfdgfghg ahdg")),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text("ksh 1000",
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
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.orange,
                      )),
                  const SizedBox(
                    width: 3,
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
