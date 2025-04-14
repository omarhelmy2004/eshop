import 'package:eshop/config/presentation/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';


class InfoBottomNavigationBar extends StatelessWidget {
  const InfoBottomNavigationBar({
    super.key,
    required this.onItemTapped,
  });
  final Function(int) onItemTapped;
  @override
  Widget build(BuildContext context) {
    return CustomBottomNavigationBar(
      onItemTapped: onItemTapped,
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.green,
      items: iconsList,
    );
  }

  List<BottomNavigationBarItem> get iconsList {
    return const [
      BottomNavigationBarItem(
        activeIcon: Icon(Icons.home),
        icon: Icon(Icons.home_outlined),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        activeIcon: Icon(Icons.grid_view_rounded),
        icon: Icon(Icons.grid_view_outlined),
        label: 'Categories',
      ),
      BottomNavigationBarItem(
        activeIcon: Icon(Icons.shopping_cart_rounded),
        icon: Icon(Icons.shopping_cart_outlined),
        label: 'My Cart',
      ),
      BottomNavigationBarItem(
        activeIcon: Icon(Icons.person_2_rounded),
        icon: Icon(Icons.person_2_outlined),
        label: 'Profile',
      ),
      
    ];
  }
}

