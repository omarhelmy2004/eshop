import 'package:eshop/features/products/data/product_model.dart';
import 'package:eshop/features/products/presentation/widgets/vertical_products_grid.dart';
import 'package:flutter/material.dart';
import 'package:eshop/config/presentation/rounded_app_bar.dart';

class SelectedCategoryPage extends StatelessWidget {
  final String categoryName;

  const SelectedCategoryPage({super.key, required this.categoryName, required this.productslist});
  final List<ProductModel> productslist;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RoundedAppBar(
        text: categoryName,
        color: Colors.white,
      ),
      body:  Padding(padding:EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
      child: Column(
        children: [
          
          VerticalProductsGrid(categoryName: categoryName, productsList: productslist),
        ],
      ),
      ),
    );
  }
}