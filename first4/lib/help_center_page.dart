import 'package:flutter/material.dart';
class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Stocky'),
        backgroundColor: Colors.brown.shade700,
      ),
  );
}