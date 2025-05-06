import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshop/features/products/data/product_model.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> fetchCartItems(String userId) async {
    int retryCount = 0;
    const int maxRetries = 3;
    const Duration retryDelay = Duration(seconds: 2);

    while (retryCount < maxRetries) {
      try {
        emit(CartLoading());
        final cartSnapshot =
            await _firestore.collection('carts').doc(userId).get();
        if (cartSnapshot.exists) {
          final List<ProductModel> cartItems =
              (cartSnapshot.data()?['items'] as List)
                  .map((item) => ProductModel.fromJson(item))
                  .toList();
          emit(CartLoaded(cartItems));
        } else {
          emit(CartLoaded([]));
        }
        return; // Exit the loop if successful
      } catch (e) {
        retryCount++;
        if (retryCount >= maxRetries) {
          emit(
              CartError('Failed to fetch cart items. Please try again later.'));
          return;
        }
        await Future.delayed(retryDelay);
      }
    }
  }

  Future<void> addItemToCart(String userId, ProductModel product) async {
    try {
      emit(CartLoading());
      final cartRef = _firestore.collection('carts').doc(userId);
      final cartSnapshot = await cartRef.get();

      if (cartSnapshot.exists) {
        final List items = cartSnapshot.data()?['items'] ?? [];
        items.add(product.toJson());
        await cartRef.update({'items': items});
      } else {
        await cartRef.set({
          'items': [product.toJson()]
        });
      }

      fetchCartItems(userId);
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> removeItemFromCart(String userId, ProductModel product) async {
    try {
      emit(CartLoading());
      final cartRef = _firestore.collection('carts').doc(userId);
      final cartSnapshot = await cartRef.get();

      if (cartSnapshot.exists) {
        final List items = cartSnapshot.data()?['items'] ?? [];
        items.removeWhere((item) => item['id'] == product.id);
        await cartRef.update({'items': items});
      }

      fetchCartItems(userId);
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> addQuantity(String userId, ProductModel product) async {
    try {
      emit(CartLoading());
      final cartRef = _firestore.collection('carts').doc(userId);
      final cartSnapshot = await cartRef.get();

      if (cartSnapshot.exists) {
        final List items = cartSnapshot.data()?['items'] ?? [];
        for (var item in items) {
          if (item['id'] == product.id) {
            item['quantity'] = (item['quantity'] ?? 1) + 1;
          }
        }
        await cartRef.update({'items': items});
      }

      fetchCartItems(userId);
    } catch (e) {
      emit(CartError('Failed to increase quantity: $e'));
    }
  }

  Future<void> subtractQuantity(String userId, ProductModel product) async {
    try {
      emit(CartLoading());
      final cartRef = _firestore.collection('carts').doc(userId);
      final cartSnapshot = await cartRef.get();

      if (cartSnapshot.exists) {
        final List items = cartSnapshot.data()?['items'] ?? [];
        for (var item in items) {
          if (item['id'] == product.id) {
            item['quantity'] = (item['quantity'] ?? 1) - 1;
            if (item['quantity'] <= 0) {
              items.remove(item);
            }
            break;
          }
        }
        await cartRef.update({'items': items});
      }

      fetchCartItems(userId);
    } catch (e) {
      emit(CartError('Failed to decrease quantity: $e'));
    }
  }

  Future<void> removeFromCart(String userId, ProductModel product) async {
    try {
      emit(CartLoading());
      final cartRef = _firestore.collection('carts').doc(userId);
      final cartSnapshot = await cartRef.get();

      if (cartSnapshot.exists) {
        final List items = cartSnapshot.data()?['items'] ?? [];
        items.removeWhere((item) => item['id'] == product.id);
        await cartRef.update({'items': items});
      }

      fetchCartItems(userId);
    } catch (e) {
      emit(CartError('Failed to remove item from cart: $e'));
    }
  }

  double calculateTotalAmount(List<ProductModel> cartItems) {
    return cartItems.fold(
        0, (total, item) => total + (item.price * item.quantity));
  }
}
