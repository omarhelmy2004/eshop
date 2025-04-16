import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshop/features/products/data/product_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> fetchWishlistItems(String userId) async {
    try {
      emit(WishlistLoading());
      final wishlistSnapshot = await _firestore.collection('wishlists').doc(userId).get();
      if (wishlistSnapshot.exists) {
        final List<ProductModel> wishlistItems = (wishlistSnapshot.data()?['items'] as List)
            .map((item) => ProductModel.fromJson(item))
            .toList();
        emit(WishlistLoaded(wishlistItems));
      } else {
        emit(WishlistLoaded([]));
      }
    } catch (e) {
      emit(WishlistError(e.toString()));
    }
  }

  Future<void> addToWishlist(String userId, ProductModel product) async {
    try {
      final wishlistRef = _firestore.collection('wishlists').doc(userId);
      final wishlistSnapshot = await wishlistRef.get();

      if (wishlistSnapshot.exists) {
        final List<dynamic> currentItems = wishlistSnapshot.data()?['items'] ?? [];
        currentItems.add(product.toJson());
        await wishlistRef.update({'items': currentItems});
      } else {
        await wishlistRef.set({'items': [product.toJson()]});
      }

      fetchWishlistItems(userId);
    } catch (e) {
      emit(WishlistError(e.toString()));
    }
  }

  Future<void> removeFromWishlist(String userId, ProductModel product) async {
    try {
      final wishlistRef = _firestore.collection('wishlists').doc(userId);
      final wishlistSnapshot = await wishlistRef.get();

      if (wishlistSnapshot.exists) {
        final List<dynamic> currentItems = wishlistSnapshot.data()?['items'] ?? [];
        currentItems.removeWhere((item) => item['id'] == product.id);
        await wishlistRef.update({'items': currentItems});
      }

      fetchWishlistItems(userId);
    } catch (e) {
      emit(WishlistError(e.toString()));
    }
  }
}