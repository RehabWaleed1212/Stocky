import 'package:flutter/material.dart';
class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Favorites'),
      backgroundColor: Colors.brown,
    ),
  );
}