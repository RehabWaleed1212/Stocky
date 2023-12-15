import 'package:flutter/material.dart';

class CustomLogoAuth extends StatelessWidget {
  const CustomLogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          alignment: Alignment.center,
          width: 200,
          height: 200,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(40)),
          child: Image.asset(
            "image/logo1.jpg",
            height: 300,
            width: 600,
            // fit: BoxFit.fill,
          )),
    );
  }
}