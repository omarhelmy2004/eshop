import 'package:eshop/features/products/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

class HorizontalProductsGrid extends StatelessWidget {
  const HorizontalProductsGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          
          crossAxisCount: 1,
          
          mainAxisSpacing: 20,
          childAspectRatio: 1.6,
          
        ),
        itemBuilder: (context, index) {
          return const ProductCard();
        },
      ),
    );
  }
}
