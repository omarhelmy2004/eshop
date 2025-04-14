import 'package:eshop/core/presentation/widgets/logo.dart';
import 'package:eshop/core/presentation/widgets/search_bar.dart';
import 'package:eshop/features/products/presentation/pages/wishlist_page.dart';
import 'package:eshop/features/products/presentation/widgets/products_grid.dart';
import 'package:eshop/features/products/presentation/widgets/promo_banner.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Logo(),
            SizedBox(width: 15), // Adjust spacing between Logo and SearchBar
            Expanded(
              child: SizedBox(
                height: 40,
                child: CustomSearchBar(enColor: Colors.green, foColor: Colors.black),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border_rounded, size: 28), // Adjust icon size
            onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WishlistPage(),
            ),
          );
            },
          ),
          const SizedBox(width: 10), // Add spacing after the favorite icon
        ],
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add promotional banner
            SizedBox(
              height: 170,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView(
                    children: [
                      PromoBanner(
                        discount: '30% OFF',
                        title: 'On Headphones',
                        subtitle: 'Exclusive Sales',
                        image: 'https://static.vecteezy.com/system/resources/thumbnails/044/283/776/small_2x/white-headphone-on-transparent-background-image-png.png',
                      ),
                      PromoBanner(
                        discount: '50% OFF',
                        title: 'On Speakers',
                        subtitle: 'Limited Time Offer',
                        image: 'https://static.vecteezy.com/system/resources/thumbnails/044/283/776/small_2x/white-headphone-on-transparent-background-image-png.png',
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IndicatorDot(isActive: true),
                        IndicatorDot(isActive: false),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Add spacing after the banner
            const Text('Products', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            const ProductsGrid(),
          ],
        ),
      ),
    );
  }
}
