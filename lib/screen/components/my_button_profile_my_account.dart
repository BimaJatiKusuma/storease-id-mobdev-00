import 'package:flutter/material.dart';

class MyButtonProfileMyAccount extends StatelessWidget {
  final String title;
  final Icon icon;
  final Function()? onPressed;

  const MyButtonProfileMyAccount({
    required this.icon,
    required this.onPressed,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Row(
          children: [
            icon,
            SizedBox(width: 10,),
            Expanded(child: Text(title)),
            Icon(Icons.arrow_forward_ios)
          ],
        ));
  }
}
