import 'package:flutter/material.dart';

class MyButtonAuth2 extends StatelessWidget {
  final Function()? onTap;
  final String label_name;
  final Color backgroundColor;
  final Color textColor;
  final BoxBorder? boxBorder;

  const MyButtonAuth2(
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
        padding: EdgeInsets.all(15),
        // margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(25), border: boxBorder),
        child: Text(
          label_name,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
