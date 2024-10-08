import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyButtonProfileEdit extends StatelessWidget {
  final Function onTap;
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
        onTap: () {
          onTap;
        },
        borderRadius: BorderRadius.circular(10), // InkWell splash will follow rounded corners
        splashColor: color.withOpacity(0.3), // Customize splash color
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            title,
            style: TextStyle(color: color),
          ),
        ),
      ),
    );
  }
}
