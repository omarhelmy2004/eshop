import 'package:eshop/core/presentation/widgets/logo.dart';
import 'package:flutter/material.dart';
import '../widgets/email_input_field.dart';
import '../widgets/password_input_field.dart';
import '../widgets/sign_button.dart';
import 'signup_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static String id = 'LoginPage';

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Logo(),
              const SizedBox(height: 30),
              const Text("Login", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Text("Don't have an account? ", style: TextStyle(fontSize: 18)),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) => const SignupPage(),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      );
                    },
                    child: const Text(
                      "Signup",
                      style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              EmailInputField(
                enColor: Colors.green,
                foColor: Colors.black,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              PasswordInputField(
                enColor: Colors.green,
                foColor: Colors.black,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25),
              SignupButton(
                text: 'Login',
                formKey: _formKey,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle login logic here
                  }
                },
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}

