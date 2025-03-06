import 'package:eshop/features/auth/presentation/pages/login_page.dart';
import 'package:eshop/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Eshop());
}
class Eshop extends StatelessWidget {
  const Eshop({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
     debugShowCheckedModeBanner: false, 
      routes: {
        LoginPage.id : (context) => const LoginPage(),
        SignupPage.id : (context) => const SignupPage(),
      },
      initialRoute: LoginPage.id,
    );
  }
}