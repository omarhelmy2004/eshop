import 'package:eshop/core/presentation/widgets/logo.dart';
import 'package:eshop/core/presentation/widgets/search_bar.dart';
import 'package:eshop/features/products/presentation/widgets/category_img.dart';
import 'package:eshop/features/products/presentation/widgets/products_grid.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Logo(),
            SizedBox(
              width: 230,
              height: 40,
              child: CustomSearchBar(enColor: Colors.green, foColor: Colors.black)),
          ],
        ),
        actions: [
          GestureDetector(
            child: IconButton(
              icon: Icon(Icons.favorite_border_rounded),
              onPressed: () {
               
              },
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            
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


