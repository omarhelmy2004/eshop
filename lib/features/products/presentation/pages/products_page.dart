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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                ListView(
                  children: [GridView.builder(
                    
                    shrinkWrap: true,
                    itemCount: 20,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 200,
                        width: 200,
                        color: Colors.grey,
                      );
                    },
                  ),]
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}