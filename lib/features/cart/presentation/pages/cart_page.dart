import 'package:eshop/features/auth/presentation/widgets/sign_button.dart';
import 'package:eshop/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:eshop/features/products/data/product_model.dart';
import 'package:eshop/features/products/presentation/pages/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String userId = "user123"; // Replace with actual user ID logic

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          const WishlistButton(),
          const SizedBox(width: 10),
        ],
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
                    child: ListView(
                      children: cartItems.map((product) => CartItem(
                        imageUrl: product.image,
                        title: product.title,
                        price: product.price,
                        originalPrice: product.price + 5, // Example logic
                      )).toList(),
                    ),
                  ),
                  const OrderInfo(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 9),
                    child: SignupButton(
                      onPressed: () {},
                      formKey: GlobalKey<FormState>(),
                      text: 'Checkout (${cartItems.length})',
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
  final String imageUrl;
  final String title;
  final double price;
  final double originalPrice;

  const CartItem({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.originalPrice,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 60,
                  height: 60,
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.broken_image,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.length > 20 ? '${title.substring(0, 20)}...' : title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '\$$price',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$$originalPrice',
                  style: const TextStyle(
                    fontSize: 14,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
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

class WishlistButton extends StatelessWidget {
  const WishlistButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const WishlistPage(),
          ),
        );
      },
      style: TextButton.styleFrom(
        foregroundColor: Colors.black87,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: const Row(
        children: [
          Icon(Icons.favorite_border_rounded, size: 20),
          SizedBox(width: 8),
          Text('Wishlist', style: TextStyle(fontSize: 16)),
          SizedBox(width: 4),
          Icon(Icons.arrow_forward_ios_rounded, size: 16),
        ],
      ),
    );
  }
}