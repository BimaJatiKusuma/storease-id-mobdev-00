import 'package:flutter/material.dart';

class MyButtonProfileConfigure extends StatelessWidget {
  final Function()? onTap;
  final String label_name;
  final Color textColor;
  final Color colorBorder;

  const MyButtonProfileConfigure({
    super.key,
    required this.colorBorder,
    required this.onTap,
    required this.label_name,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10), // Rounded corners
      child: InkWell(
        onTap: () {
          if (onTap != null) {
            onTap!(); // Call the onTap function when tapped
          }
        },
        borderRadius: BorderRadius.circular(10), // InkWell splash will follow rounded corners
        splashColor: colorBorder.withOpacity(0.3), // Customize splash color
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: colorBorder),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            label_name,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
