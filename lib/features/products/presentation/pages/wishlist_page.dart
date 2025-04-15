import 'package:eshop/features/products/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';


class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> wishlistItems = [
      {
        'imageUrl': 'https://m.media-amazon.com/images/I/81uiWMk9dnL._AC_SL1500_.jpg',
        'title': 'Nike Air Jordan Retro',
        'price': '\$126.00',
      },
      {
        'imageUrl': 'https://m.media-amazon.com/images/I/81uiWMk9dnL._AC_SL1500_.jpg',
        'title': 'Adidas Ultraboost',
        'price': '\$150.00',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
      body: wishlistItems.isEmpty
          ? const Center(
              child: Text(
                'Your wishlist is empty!',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemCount: wishlistItems.length,
                itemBuilder: (context, index) {
                  final item = wishlistItems[index];
                  return ProductCard(
                    key: ValueKey(item['title']),
                    // Pass necessary data to ProductCard
                  );
                },
              ),
            ),
    );
  }
}