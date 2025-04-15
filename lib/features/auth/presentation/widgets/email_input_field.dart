// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class EmailInputField extends StatelessWidget {
  const EmailInputField({
    super.key,
    required this.validator,
    required this.enColor,
    required this.foColor, this.onChanged, this.controller,
    
  });

  final String? Function(String?) validator;
   final Color enColor;
  final Color foColor;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Email *", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            hintText: "Enter your email",
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
