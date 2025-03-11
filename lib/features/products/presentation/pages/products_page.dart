import 'package:eshop/core/presentation/widgets/search_bar.dart';
import 'package:eshop/features/products/presentation/widgets/products_grid.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            CustomSearchBar(enColor: Colors.green,
                foColor: Colors.black,),
            const Text('Categories', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        color: Colors.grey,
                      ),
                      const Text('Electronics', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        color: Colors.grey,
                      ),
                      const Text('Clothing', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            const Text('Products', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ProductsGrid(),
          ],
        ),
      ),
    );
  }
}
