import 'package:flutter/material.dart';

class CategoryIMG extends StatelessWidget {
  const CategoryIMG({
    super.key, required this.image, this.height = 50, this.width = 50, required this.text,  this.fontSize = 13,
  });
  final String image;
  final double height;
  final double width;
  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          Image.asset(image, height: height, width: width), // Use provided height and width
          Text(text, style:  TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}