import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final dynamic product;
  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        actions: [
          SearchBar(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            overlayColor: MaterialStateProperty.all(Colors.white),
            constraints: const BoxConstraints(maxWidth: 310, maxHeight: 40),
          ),
          const SizedBox(
            width: 5,
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                size: 35,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.network(
              product['image'],
              fit: BoxFit.contain,
              height: 300,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['title'],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product['description'],
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("ksh ${product['price']}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.orange)),
                        onPressed: () {
                          // Add to Cart logic
                        },
                        child: const Row(
                          children: [
                            Text(
                              'Add to cart',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            Icon(
                              Icons.shopping_cart,
                              size: 18,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Ratings',
                        style: TextStyle(fontSize: 16),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.amber,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${product['rating']['rate'].toString()} (${product['rating']['count'].toString()} users)',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Specifications',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Size: M',
                    style: TextStyle(fontSize: 16),
                  ),
                  const Text(
                    'Color: Red',
                    style: TextStyle(fontSize: 16),
                  ),
                  const Text(
                    'Material: Cotton',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Customer Reviews',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const ListTile(
                    leading: CircleAvatar(
                      child: Text('JD'),
                    ),
                    title: Text('John Doe'),
                    subtitle: Text('Great product! Highly recommended.'),
                  ),
                  const ListTile(
                    leading: CircleAvatar(
                      child: Text('LM'),
                    ),
                    title: Text('Lisa Smith'),
                    subtitle: Text('Good quality and fast shipping.'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
