
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.transparent, // Made background transparent
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Image.network(
                    'https://m.media-amazon.com/images/I/81uiWMk9dnL._AC_SL1500_.jpg', // Changed to network image
                    fit: BoxFit.cover,
                  ),
                ),
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
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Nike air jordan retro fa...',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis, // Added ellipsis for overflow
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '\$126.00',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

