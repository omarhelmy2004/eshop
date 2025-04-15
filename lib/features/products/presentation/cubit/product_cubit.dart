import 'package:bloc/bloc.dart';
import 'package:eshop/config/helper/api.dart';

import 'package:eshop/features/products/data/product_model.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  
  void getAllProducts() async {
    try {
  emit(ProductLoading());
  Map<String, dynamic> response =
      await Api().get(url: 'https://fakestoreapi.in/api/products');
  
  if (response['status'] == 'SUCCESS' && response['products'] is List) {
    List<dynamic> productsData = response['products'];
    List<ProductModel> productsList = productsData
        .map((product) => ProductModel.fromJson(product))
        .toList();
        
   emit(ProductLoaded(productsList));
    
  } 
} on Exception catch (e) {
  emit(ProductError(e.toString()));
}
  }
}

