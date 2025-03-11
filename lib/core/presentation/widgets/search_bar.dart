import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key, required this.enColor, required this.foColor,
  });
  final Color enColor;
  final Color foColor;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: const Icon(Icons.search),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(
                width: 2,
                color: foColor,
                
              ),
              
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(
                width: 2,
                color: enColor,
              ),
              
            ), 
        ),
      ),
    );
  }
}