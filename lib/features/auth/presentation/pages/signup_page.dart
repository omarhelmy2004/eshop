import 'package:flutter/material.dart';
import '../widgets/signup_button.dart';
import '../widgets/email_input_field.dart';
import '../widgets/password_input_field.dart';
import '../widgets/confirm_password_input_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  static String id = 'SignupPage';

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Row(
                children: [
                  Icon(Icons.shopping_cart, color: Colors.teal, size: 30),
                  SizedBox(width: 8),
                  Text(
                    "QuickMart",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text("Signup", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Row(
                children: [
                  Text("Already have an account? ", style: TextStyle(fontSize: 18)),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'LoginPage');
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
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
              SizedBox(height: 15),
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
              SizedBox(height: 15),
              ConfirmPasswordInputField(
                enColor: Colors.green,
                foColor: Colors.black,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                
              ),
              SizedBox(height: 25),
              SignupButton(
                formKey: _formKey,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle signup logic here
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
