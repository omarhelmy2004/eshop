import 'package:flutter/material.dart';

class ConfirmPasswordInputField extends StatelessWidget {
  const ConfirmPasswordInputField({super.key, required this.validator,  required this.enColor,  required this.foColor});

  final String? Function(String?) validator;
  final Color enColor;
  final Color foColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Confirm Password *", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        TextFormField(
          obscureText: true,
          validator: validator,
          decoration: InputDecoration(
            hintText: "Confirm your password",
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: foColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: enColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))  
          ),
        ),
      ],
    );
  }
}

