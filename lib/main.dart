
import 'package:eshop/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Eshop());
}
class Eshop extends StatelessWidget {
  const Eshop({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      routes: {
        LoginPage.id : (context) => const LoginPage(),

      },
      initialRoute: LoginPage.id,
    );
  }
}