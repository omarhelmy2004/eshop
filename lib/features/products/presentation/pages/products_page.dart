import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        
        actions: const [
        Icon(Icons.search, color: Colors.black, size: 33,),
        Icon(Icons.person_outlined, color: Colors.black, size: 33,),
        SizedBox(width: 8,),
        ],
      
      
      ),
    );
  }
}