import 'package:eshop/core/presentation/widgets/search_bar.dart';
import 'package:eshop/features/products/presentation/widgets/products_grid.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            CustomSearchBar(enColor: Colors.green,
                foColor: Colors.black,),
            Text('Categories', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CategoryIMG(image: 'assets/images/images.jpg', text: 'Electronics'),
                  SizedBox(width: 10),
                  CategoryIMG(image: 'assets/images/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg', text: 'Jewelery'),
                  SizedBox(width: 10),
                  CategoryIMG(image: 'assets/images/mens.jpg', text: 'Men\'s Clothing'),
                  SizedBox(width: 10),
                  CategoryIMG(image: 'assets/images/womencloth.jpg', text: 'Women\'s Clothing'),
                ],
              ),
            ),
            Text('Products', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ProductsGrid(),
          ],
        ),
      ),
    );
  }
}

class CategoryIMG extends StatelessWidget {
  const CategoryIMG({
    super.key, required this.image,  this.height = 50,  this.width = 50, required this.text,
  });
  final String image;
  final double height;
  final double width;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image, height: 50, width: 50),
         Text(text, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
