import 'package:eshop/features/products/data/product_model.dart';
import 'package:eshop/features/products/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

class HorizontalProductsGrid extends StatelessWidget {
  const HorizontalProductsGrid({
    super.key, required this.productsList,
  });
  final List<ProductModel> productsList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productsList.length,
        
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          
          crossAxisCount: 1,
          
          mainAxisSpacing: 20,
          childAspectRatio: 1.6,
          
        ),
        itemBuilder: (context, index) {
          return  ProductCard(productModel: productsList[index],);
        },
      ),
    );
  }
}
