import 'package:flutter/material.dart';

class H3Text extends StatelessWidget {
  const H3Text({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return  Text(
            text,
            style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold, ), 
    );
  }
}