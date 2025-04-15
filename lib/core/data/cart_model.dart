import 'product_model.dart';

class CartModel {
  final List<ProductModel> items;
  final double total;

  CartModel({
    required this.items,
    required this.total,
  });
}
