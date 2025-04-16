import 'package:eshop/features/products/data/product_model.dart';
import 'package:eshop/features/products/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

class VerticalProductsGrid extends StatelessWidget {
  const VerticalProductsGrid({
    super.key, required this.productsList, required this.categoryName,
  });
  final String categoryName;
final List<ProductModel> productsList;
  @override
  Widget build(BuildContext context) {
    final List<ProductModel> filteredProducts = productsList
              .where((product) => product.category== categoryName.toLowerCase())
              .toList();
    return Expanded(
      child: GridView.builder(
        itemCount: filteredProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 50,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          
          return ProductCard(productModel: filteredProducts[index]);
        }
        ,
      ),
    );
  }
}
