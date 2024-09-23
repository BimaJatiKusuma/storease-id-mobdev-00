import 'package:flutter/material.dart';

class MyTextfieldProfileEdit extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final String labelText;

  const MyTextfieldProfileEdit({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text(labelText)]),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromRGBO(200, 200, 200, 1)),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200)),
              fillColor: Colors.white,
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey[500])),
        ),
      ],
    );
  }
}
