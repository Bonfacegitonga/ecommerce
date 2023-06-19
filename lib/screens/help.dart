import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  bool light = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            child: FractionallySizedBox(
              widthFactor: 0.9,
              child: Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(left: 20),
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(7)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.message,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Text(
                      "START LIVE CHAT",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            //margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.only(top: 10, left: 20),
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(color: Colors.grey[200]),
            child: const Text("About Store"),
          ),
          const SizedBox(
            height: 5,
          ),
          const ListTile(
            title: Text("Store Service"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ),
          const ListTile(
            title: Text("Frequently Asked Questions"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            //margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.only(top: 10, left: 20),
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(color: Colors.grey[200]),
            child: const Text("SETTING"),
          ),
          const SizedBox(
            height: 5,
          ),
          ListTile(
            title: const Text("Push Notification"),
            trailing: Switch(
              activeColor: Colors.orange[100],
              value: light,
              thumbColor: const MaterialStatePropertyAll<Color>(Colors.orange),
              onChanged: (bool value) {
                setState(() {
                  light = value;
                });
              },
            ),
          ),
          const ListTile(
            title: Text("Language"),
            trailing: Text(
              "ENGLISH",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            //margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.only(top: 10, left: 20),
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(color: Colors.grey[200]),
            child: const Text("MY SETTING"),
          ),
          const SizedBox(
            height: 5,
          ),
          ListTile(
            title: const Text("App Version 1.1"),
            trailing: Text(
              "Upto Date",
              style: TextStyle(color: Colors.grey[400]),
            ),
          ),
          ListTile(
            title: const Text("Cache used: 105kb"),
            trailing: Text(
              "Clear",
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
        ],
      ),
    );
  }
}
