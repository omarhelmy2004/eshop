import 'package:eshop/core/presentation/widgets/logo.dart';
import 'package:eshop/core/presentation/widgets/search_bar.dart';
import 'package:eshop/features/products/presentation/widgets/category_img.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

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
        actions: const [
          SizedBox(width: 16,)
        ],
        backgroundColor: Colors.white,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 150,
      width: 150,
                      child: CategoryIMG(
                        image: 'assets/images/R.png',
                        text: 'tv',
                        height: 100, // Increased size
                        width: 100,  // Increased size
                        fontSize: 18, // Set font size to 18
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 150,
      width: 150,
                      child: CategoryIMG(
                        image: 'assets/images/foldable-gaming-headset-png-05252024-vkz911ngun3r89k0.png',
                        text: 'audio',
                        height: 100, // Increased size
                        width: 100,  // Increased size
                        fontSize: 18, // Set font size to 18
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 150,
      width: 150,
                      child: CategoryIMG(
                        image: 'assets/images/images.jpg',
                        text: 'mobile',
                        height: 100, // Increased size
                        width: 100,  // Increased size
                        fontSize: 18, // Set font size to 18
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 150,
      width: 150,
                      child: CategoryIMG(
                        image: 'assets/images/gamer-controller-isolated-png.png',
                        text: 'gaming',
                        height: 100, // Increased size
                        width: 100,  // Increased size
                        fontSize: 18, // Set font size to 18
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}