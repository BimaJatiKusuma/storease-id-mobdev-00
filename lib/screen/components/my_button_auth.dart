import 'package:flutter/material.dart';

class MyButtonAuth extends StatelessWidget {
  final Function()? onTap;
  final String label_name;
  final Color backgroundColor;
  final Color textColor;
  final BoxBorder? boxBorder;

  const MyButtonAuth(
      {super.key,
      this.boxBorder,
      required this.onTap,
      required this.label_name,
      required this.backgroundColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(5), border: boxBorder),
        child: Center(
          child: Text(
            label_name,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
