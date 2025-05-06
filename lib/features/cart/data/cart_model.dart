import 'package:eshop/features/products/data/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartModel {
  final String userId;
  final List<ProductModel> items;

  CartModel({
    required this.userId,
    required this.items,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      userId: json['userId'],
      items: (json['items'] as List)
          .map((item) => ProductModel.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }
}

Future<void> createCartDocument(String userId) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Example cart data
  final cart = CartModel(
    userId: userId,
    items: [
      ProductModel(
        id: 1,
        title: "Sample Product",
        price: 19.99,
        description: "A sample product description",
        image: "sample_image_url",
        category: "Sample Category",
        brand: "Sample Brand",
        model: "Sample Model",
        color: "Red",
        discount: 10,
        popular: true,
        onSale: false,
      ),
    ],
  );

  try {
    await firestore.collection('carts').doc(userId).set(cart.toJson());
    print("Cart document created successfully!");
  } catch (e) {
    print("Error creating cart document: $e");
  }
}
