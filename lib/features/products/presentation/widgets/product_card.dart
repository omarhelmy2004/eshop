import 'package:eshop/features/products/data/product_model.dart';
import 'package:flutter/material.dart';
import 'package:eshop/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isWishlisted = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5), // New background color
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.transparent, // Made background transparent
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Image.network(
                    widget.productModel.image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Icon(
                          Icons.broken_image,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              ),
               Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  widget.productModel.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis, // Added ellipsis for overflow
                ),
              ),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Text(
                        '\$${widget.productModel.price.toString()}',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    SizedBox(width: 5),
                   
                  ],
                ),
              ),
              const Spacer(), // Added Spacer to push the button to the bottom
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    final userId = "user123"; // Replace with actual user ID logic
                    context.read<CartCubit>().addItemToCart(userId, widget.productModel);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Product added to cart!')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(double.infinity, 40),
                  ),
                  child: const Text('Buy', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isWishlisted = !isWishlisted;
                });
              },
              child: Icon(
                isWishlisted ? Icons.favorite : Icons.favorite_border,
                color: isWishlisted ? Colors.red : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

