import 'package:flutter/material.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key, required this.onPressed, required this.formKey});

  final VoidCallback onPressed;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        minimumSize: Size(double.infinity, 50),
      ),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          onPressed();
        }
      },
      child: Text("Create Account", style: TextStyle(color: Colors.white)),
    );
  }
}
