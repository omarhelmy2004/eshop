import 'category_model.dart';

class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  final CategoryModel category;
  final String brand;
  final String model;
  final String color;
  final int discount;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
    required this.brand,
    required this.model,
    required this.color,
    required this.discount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      image: json['image'],
      category: CategoryModel(name: json['category']),
      brand: json['brand'],
      model: json['model'],
      color: json['color'],
      discount: json['discount'],
    );
  }
}
