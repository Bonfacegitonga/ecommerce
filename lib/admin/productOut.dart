import 'package:flutter/material.dart';

class ProductsOut extends StatefulWidget {
  const ProductsOut({super.key});

  @override
  State<ProductsOut> createState() => _ProductsOutState();
}

class _ProductsOutState extends State<ProductsOut>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: []),
    );
  }
}
