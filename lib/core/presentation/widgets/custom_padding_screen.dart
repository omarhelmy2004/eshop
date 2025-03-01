import 'package:flutter/material.dart';

class CustomPaddingScreen extends StatelessWidget {
  const CustomPaddingScreen({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: child,
    );
  }
}