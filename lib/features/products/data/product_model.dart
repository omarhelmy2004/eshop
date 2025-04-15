class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  final String category;
  final String brand;
  final String model;
  final String color;
  final int? discount;
  final bool? popular;
  final bool? onSale;

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
    this.discount,
    this.popular,
    this.onSale,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      image: json['image'],
      category: json['category'],
      brand: json['brand'],
      model: json['model'],
      color: json['color'],
      discount: json['discount'],
      popular: json['popular'],
      onSale: json['onSale'],
    );
  }
}