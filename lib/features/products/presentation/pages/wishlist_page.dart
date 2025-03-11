import 'package:eshop/core/presentation/widgets/search_bar.dart';
import 'package:eshop/features/products/presentation/widgets/products_grid.dart';
import 'package:flutter/material.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(padding:EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 9.0),
            child: CustomSearchBar(enColor: Colors.green,
                  foColor: Colors.black,),
          ),
          ProductsGrid(),
        ],
      ),
      ),
    );
  }
}