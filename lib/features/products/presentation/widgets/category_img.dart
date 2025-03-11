import 'package:flutter/material.dart';

class CategoryIMG extends StatelessWidget {
  const CategoryIMG({
    super.key, required this.image,  this.height = 50,  this.width = 50, required this.text,
  });
  final String image;
  final double height;
  final double width;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image, height: 60, width: 60),
         Text(text, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
      ],
    );
  }
}