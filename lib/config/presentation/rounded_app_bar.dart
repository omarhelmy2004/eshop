import 'package:flutter/material.dart';

class RoundedAppBar extends StatelessWidget {
  const RoundedAppBar({super.key, required this.text, required this.color, this.icon});
  final String text;
  final Color color;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return  AppBar(
          
          backgroundColor: color,
          shape: ShapeBorder.lerp(
            
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            0.5,
          ),
          scrolledUnderElevation: 0,
          title: Text( text ,
          style:  const TextStyle(fontSize: 25, fontWeight: FontWeight.bold )),
          
          centerTitle: true,
          actions: const [
          
        ],
        );
  }
}