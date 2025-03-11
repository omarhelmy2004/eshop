
import 'package:flutter/material.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          return Container(
            height: 20,
            width: 20,
            color: Colors.grey,
          );
        },
      ),
    );
  }
}

