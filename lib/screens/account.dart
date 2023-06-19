import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final List<Map<String, dynamic>> itemsData = [
    {'icon': Icons.indeterminate_check_box, 'name': 'Orders'},
    {'icon': Icons.mail, 'name': 'Inbox'},
    {'icon': Icons.reviews, 'name': 'Pending reviews'},
    {'icon': Icons.check_box_outline_blank, 'name': 'Vouchers'},
    {'icon': Icons.favorite, 'name': 'Saved Items'},
    {'icon': Icons.history, 'name': 'Recently Viewed'},
    {'icon': Icons.search, 'name': 'Recently Searched'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.only(top: 10, left: 20),
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(color: Colors.grey[200]),
            child: const Text("MY STORE ACCOUNT"),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: itemsData.length,
              itemBuilder: (BuildContext context, index) {
                final item = itemsData[index];
                return ListTile(
                  leading: Icon(
                    item['icon'],
                    size: 20,
                  ),
                  title: Text(item['name']),
                  trailing: const Icon(Icons.arrow_forward_ios),
                );
              }),
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
          const ListTile(
            title: Text("Address Book"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ),
          const ListTile(
            title: Text("Close Account"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          ElevatedButton(
            onPressed: () {},
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.orange)),
            child: const Text(
              "Login",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
