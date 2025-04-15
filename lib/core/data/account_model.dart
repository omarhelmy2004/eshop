import 'cart_model.dart';
import 'product_model.dart';

class AccountModel {
  final String id;
  final CartModel cart;
  final String email;
  final List<ProductModel> wishlist;

  AccountModel(this.id, this.cart, this.email, this.wishlist);
}