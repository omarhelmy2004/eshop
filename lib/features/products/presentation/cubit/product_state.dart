part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductLoaded extends ProductState {
  final List<ProductModel> productsList;

  ProductLoaded(this.productsList);
}
final class ProductError extends ProductState {
  final String error;

  ProductError(this.error);
}
