import 'package:eshop/features/cart/presentation/pages/cart_page.dart';
import 'package:eshop/features/products/presentation/pages/category_page.dart';
import 'package:eshop/features/products/presentation/pages/products_page.dart';
import 'package:eshop/features/products/presentation/pages/wishlist_page.dart';
import 'package:flutter/material.dart';


class ViewsListWidget extends StatelessWidget {
  const ViewsListWidget({super.key, required this.selectedIndex});
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return  <Widget>[
      const ProductsPage(),
      const CategoryPage(),
      const CartPage(),
      const WishlistPage(),
     
      // const ReportsView(),
      // const BudgetView(),
      // const TransactionsView(),
      // GoalsView(onEdit: () {  },),
    ][selectedIndex];
  }
}
