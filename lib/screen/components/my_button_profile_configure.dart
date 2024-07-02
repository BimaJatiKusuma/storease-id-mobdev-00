import 'package:flutter/material.dart';

class MyButtonProfileConfigure extends StatelessWidget {
  final Function()? onTap;
  final String label_name;
  final Color textColor;
  final Color colorBorder;

  const MyButtonProfileConfigure(
      {super.key,
      required this.colorBorder,
      required this.onTap,
      required this.label_name,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: colorBorder)),
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
