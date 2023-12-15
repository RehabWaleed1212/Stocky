import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: const Text('user'),
        ),
        body: Icon(CupertinoIcons.person,
          color: Color.fromARGB(255, 163, 143, 71),
        ),
      );
}
