import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key, required this.enColor, required this.foColor,
  });
  final Color enColor;
  final Color foColor;
  @override
  Widget build(BuildContext context) {
    return  TextField(
      decoration: InputDecoration(
        hintText: 'Search...' ,
        hintStyle: const TextStyle(fontSize: 13),
        prefixIcon: const Icon(Icons.search),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
              width: 2,
              color: foColor,
              
            ),
            
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
              width: 2,
              color: enColor,
            ),
            
          ), 
      ),
    );
  }
}