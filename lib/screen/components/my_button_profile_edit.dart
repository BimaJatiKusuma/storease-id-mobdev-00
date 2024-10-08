import 'package:flutter/material.dart';

class MyButtonProfileEdit extends StatelessWidget {
  final VoidCallback onTap; // Use VoidCallback for better type safety
  final String title;
  final Color color;

  const MyButtonProfileEdit({
    required this.onTap,
    required this.color,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10), // Rounded corners
      child: InkWell(
        onTap: onTap, // Directly pass the callback
        borderRadius: BorderRadius.circular(10), // InkWell splash will follow rounded corners
        splashColor: color.withOpacity(0.3), // Customize splash color
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center( // Center the text
            child: Text(
              title,
              style: TextStyle(color: color),
            ),
          ),
        ),
      ),
    );
  }
}
