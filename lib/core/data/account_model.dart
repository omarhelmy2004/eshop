
import 'package:eshop/features/products/data/product_model.dart';



class AccountModel {
  final String id;

  final String email;
  final List<ProductModel> wishlist;

  AccountModel(this.id, this.email, this.wishlist);
}