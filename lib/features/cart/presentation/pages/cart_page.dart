import 'package:eshop/features/auth/presentation/widgets/sign_button.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: const [
                CartItem(
                  imageUrl: 'https://m.media-amazon.com/images/I/81uiWMk9dnL._AC_SL1500_.jpg',
                  title: 'Loop Silicone Strong Magnetic Watch',
                  price: 15.25,
                  originalPrice: 20.00,
                ),
                CartItem(
                  imageUrl: 'https://m.media-amazon.com/images/I/81uiWMk9dnL._AC_SL1500_.jpg',
                  title: 'M6 Smart watch IP67 Waterproof',
                  price: 12.00,
                  originalPrice: 18.00,
                ),
              ],
            ),
          ),
          const OrderInfo(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:  18.0, vertical: 9),
            child: SignupButton(onPressed: () {}, formKey: GlobalKey<FormState>(), text: 'Checkout (2)'),
          ),
        ],
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
        children: [
          Image.network(imageUrl, width: 80, height: 80),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('\$$price', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {},
                  ),
                  const Text('1', style: TextStyle(fontSize: 18)),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {},
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {},
              ),
            ],
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
          Text('Order Info', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          OrderInfoRow(label: 'Subtotal', value: '\$27.25'),
          OrderInfoRow(label: 'Shipping Cost', value: '\$0.00'),
          Divider(),
          OrderInfoRow(label: 'Total', value: '\$27.25', isBold: true),
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
          Text(label, style: TextStyle(fontSize: 18, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(value, style: TextStyle(fontSize: 18, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}