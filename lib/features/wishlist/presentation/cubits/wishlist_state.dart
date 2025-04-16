part of 'wishlist_cubit.dart';

@immutable
sealed class WishlistState {}

final class WishlistInitial extends WishlistState {}

final class WishlistLoading extends WishlistState {}

final class WishlistLoaded extends WishlistState {
  final List<ProductModel> wishlistItems;

  WishlistLoaded(this.wishlistItems);
}

final class WishlistError extends WishlistState {
  final String error;

  WishlistError(this.error);
}