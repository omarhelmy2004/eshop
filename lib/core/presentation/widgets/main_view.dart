import 'package:eshop/core/presentation/widgets/info_navigation_bar.dart';
import 'package:eshop/core/presentation/widgets/views_list_widget.dart';
import 'package:eshop/features/account/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';


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
    return Scaffold(
      
        appBar: AppBar(
          
          backgroundColor: Colors.green,
          shape: ShapeBorder.lerp(
            
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            0.5,
          ),
          scrolledUnderElevation: 0,
          title: Text( pageNameOfSelectedIndex(selectedIndex) ,
          style:  const TextStyle(fontSize: 25, fontWeight: FontWeight.bold )),
          
          centerTitle: true,
          actions: [
          // Icon(Icons.search, color: Colors.black, size: 33),
          GestureDetector(child: const Icon(Icons.person_outlined, color: Colors.black, size: 33,),
          onTap: () {
            Navigator.pushNamed(context, ProfilePage.id);
          },
          ),
          const SizedBox(width: 8),
        ],
        ),
        
        bottomNavigationBar: InfoBottomNavigationBar(
          onItemTapped: _onItemTapped,
        ),
       
        body: ViewsListWidget(selectedIndex: selectedIndex));
  }
}

// Callback Flow: Child to Parent:

// The callback mechanism is indeed from child to parent in terms of notifying an event. The child widget triggers a function defined in the parent. Here’s how it works:

// Parent Widget (MainView): Defines a method to handle events (like an item tap) and passes it down to the child widget as a callback.
// Child Widget (CustomFixedBottomNavigationBar): Invokes this callback function when an event occurs (e.g., an item is tapped).
// Parent Reacts to Callback: The parent updates its state based on the callback, leading to a change in the UI.
