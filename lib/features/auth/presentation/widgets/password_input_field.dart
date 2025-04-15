import 'package:flutter/material.dart';

class PasswordInputField extends StatefulWidget {
  const PasswordInputField({super.key, required this.validator, required this.enColor, required this.foColor, this.controller});

  final String? Function(String?) validator;
    final Color enColor;
  final Color foColor;
  final TextEditingController? controller;
  @override
  _PasswordInputFieldState createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Password *", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        TextFormField(
          controller: widget.controller,
          obscureText: _obscurePassword,
          validator: widget.validator,
          decoration: InputDecoration(
            hintText: "Enter your password",
           focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: widget.foColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)) ,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: widget.enColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),  
            suffixIcon: IconButton(
              icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
