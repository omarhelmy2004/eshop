import 'package:eshop/features/products/presentation/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:eshop/features/products/presentation/pages/selected_category_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryIMG extends StatelessWidget {
  const CategoryIMG({
    super.key, required this.image, this.height = 50, this.width = 50, required this.text,  this.fontSize = 13,
  });
  final String image;
  final double height;
  final double width;
  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SelectedCategoryPage(categoryName: text, productslist: BlocProvider.of<ProductCubit>(context).products,),
            ),
          );
        },
        child: Column(
          children: [
            Image.asset(image, height: height, width: width), // Use provided height and width
            Text(text, style:  TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}