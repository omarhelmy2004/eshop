import 'package:eshop/core/presentation/widgets/main_view.dart';
import 'package:eshop/features/account/presentation/pages/profile_page.dart';
import 'package:eshop/features/auth/presentation/pages/login_page.dart';
import 'package:eshop/features/auth/presentation/pages/signup_page.dart';
import 'package:eshop/features/products/presentation/pages/selected_category_page.dart'; // Import the new page
import 'package:flutter/material.dart';

void main() {
  runApp(const Eshop());
}

class Eshop extends StatelessWidget {
  const Eshop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginPage.id: (context) => const LoginPage(),
        SignupPage.id: (context) => const SignupPage(),
        MainView.id: (context) => const MainView(),
        ProfilePage.id: (context) => const ProfilePage(),
     
      },
      initialRoute: MainView.id,
    );
  }
}