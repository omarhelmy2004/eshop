import 'package:eshop/core/presentation/widgets/info_navigation_bar.dart';
import 'package:eshop/core/presentation/widgets/views_list_widget.dart';
import 'package:eshop/features/products/presentation/cubit/product_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MainView extends StatefulWidget {
  const MainView({super.key});
  static String  id = 'MainView';
  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int selectedIndex = 0;
  String pageNameOfSelectedIndex(int selectedIndex) {
    if (selectedIndex == 0) {
      return 'Home';
    } else if (selectedIndex == 1) {
      return 'Categories';
    } else if (selectedIndex == 2) {
      return 'My Cart';
    }else {
      return 'Wishlist';
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit(),
        ),
      ],
      child: 
        Scaffold(
          
            
            
            bottomNavigationBar: InfoBottomNavigationBar(
              onItemTapped: _onItemTapped,
            ),
           
            body: ViewsListWidget(selectedIndex: selectedIndex)),
      
    );
  }
}

// Callback Flow: Child to Parent:

// The callback mechanism is indeed from child to parent in terms of notifying an event. The child widget triggers a function defined in the parent. Here’s how it works:

// Parent Widget (MainView): Defines a method to handle events (like an item tap) and passes it down to the child widget as a callback.
// Child Widget (CustomFixedBottomNavigationBar): Invokes this callback function when an event occurs (e.g., an item is tapped).
// Parent Reacts to Callback: The parent updates its state based on the callback, leading to a change in the UI.
