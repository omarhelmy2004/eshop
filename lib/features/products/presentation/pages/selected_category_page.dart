import 'package:flutter/material.dart';
import 'package:eshop/config/presentation/rounded_app_bar.dart';

class SelectedCategoryPage extends StatelessWidget {
  final String categoryName;

  const SelectedCategoryPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RoundedAppBar(
        text: categoryName,
        color: Colors.green,
      ),
      body: Center(
        child: Text('Displaying products for $categoryName'),
      ),
    );
  }
}