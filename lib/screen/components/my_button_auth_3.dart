import 'package:flutter/material.dart';

class MyButtonAuth3 extends StatelessWidget {
  final Function()? onTap;
  final String label_name;
  final Color backgroundColor;
  final Color textColor;

  const MyButtonAuth3(
      {super.key,
      required this.onTap,
      required this.label_name,
      required this.backgroundColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: EdgeInsets.all(15),
        // margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(25), border: Border.all(color: Colors.grey)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 25,
              height: 25,
              child: Image.asset("images/devicon_google.png")),
              SizedBox(width: 25,),
            Text(
              label_name,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
