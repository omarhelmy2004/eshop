
import 'package:eshop/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:eshop/features/products/data/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String userId = "user123"; // Replace with actual user ID logic

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart',
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: BlocProvider(
        create: (context) => CartCubit()..fetchCartItems(userId),
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CartLoaded) {
              final cartItems = state.cartItems;
              if (cartItems.isEmpty) {
                return const Center(
                  child: Text(
                    'Your cart is empty!',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                );
              }
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final product = cartItems[index];
                        return CartItem(
                          product: product,
                          onRemove: () {
                            context
                                .read<CartCubit>()
                                .removeItemFromCart(userId, product);
                          },
                        );
                      },
                    ),
                  ),
                  const OrderInfo(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 9),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle checkout logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: Text('Checkout (${cartItems.length})'),
                    ),
                  ),
                ],
              );
            } else if (state is CartError) {
              return Center(child: Text(state.error));
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onRemove;

  const CartItem({
    required this.product,
    required this.onRemove,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.network(product.image, width: 80, height: 80),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('\$${product.price}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: onRemove,
          ),
        ],
      ),
    );
  }
}

class OrderInfo extends StatelessWidget {
  const OrderInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Order Info',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          OrderInfoRow(label: 'Subtotal', value: '\$0.00'),
          OrderInfoRow(label: 'Shipping Cost', value: '\$0.00'),
          Divider(),
          OrderInfoRow(label: 'Total', value: '\$0.00', isBold: true),
        ],
      ),
    );
  }
}

class OrderInfoRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  const OrderInfoRow({
    required this.label,
    required this.value,
    this.isBold = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(value,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}