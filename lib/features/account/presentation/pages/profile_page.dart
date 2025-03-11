import 'package:eshop/config/presentation/rounded_app_bar.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  static String id = 'profile page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(preferredSize: Size(double.infinity, 60), child: RoundedAppBar(text: 'Profile', color: Colors.green)),
      
    );
  }
}

// import 'package:eshop/config/presentation/rounded_app_bar.dart';
// import 'package:flutter/material.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});
//   static String id = 'profile page';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:  PreferredSize(preferredSize: Size(double.infinity, 60), child: RoundedAppBar(text: 'Profile', color: Colors.green)),
      
//     );
//   }
// }