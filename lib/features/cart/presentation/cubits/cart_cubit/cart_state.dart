part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  final List<ProductModel> cartItems;

  CartLoaded(this.cartItems);
}

final class CartError extends CartState {
  final String error;

  CartError(this.error);
}
