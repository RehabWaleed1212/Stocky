import 'package:flutter/material.dart';
class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Cart'),
      backgroundColor: Colors.brown,
    ),
  );
}