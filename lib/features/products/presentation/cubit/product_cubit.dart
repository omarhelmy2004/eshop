import 'package:bloc/bloc.dart';
import 'package:eshop/config/helper/api.dart';

import 'package:eshop/features/products/data/product_model.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  
  Future<List<ProductModel>> getAllProducts() async {
    Map<String, dynamic> data =
        await Api().get(url: 'https://fakestoreapi.in/api/products');

    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return productsList;
  }
}

