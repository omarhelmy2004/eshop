import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CustomToggleSwitch extends StatelessWidget {
  final List<String> labels;
  final int initialIndex;
  final Function(int) onToggle;

  const CustomToggleSwitch({
    super.key,
    required this.labels,
    this.initialIndex = 0,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0), // Adjust horizontal padding if needed
      child: ToggleSwitch(
        minWidth: 150.0, // Adjust this value as needed
        minHeight: 45,
        cornerRadius: 20.0,
        activeBgColors: const [
          [Colors.green],
          [Colors.green],
          [Colors.green]
        ],
        customTextStyles: const [
          TextStyle( color: Colors.black),
          TextStyle( color: Colors.black),
          TextStyle( color: Colors.black),
        ],
        activeFgColor: Colors.white,
        inactiveBgColor: Colors.grey.withOpacity(0.2), // Slightly transparent gray
        inactiveFgColor: Colors.white,
        initialLabelIndex: initialIndex,
        totalSwitches: labels.length,
        labels: labels,
        radiusStyle: true,
        onToggle: (index) {
          onToggle(index!); // Invoke the callback function with the index
        },
      ),
    );
  }
}