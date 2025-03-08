import 'package:flutter/material.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({
    super.key,
    required this.onPressed,
    required this.formKey,
    required this.text,
  });

  final VoidCallback onPressed;
  final GlobalKey<FormState> formKey;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.black,
        minimumSize: const Size(double.infinity, 60),
      ),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          onPressed();
        }
      },
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}
