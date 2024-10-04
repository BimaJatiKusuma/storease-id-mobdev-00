import 'package:flutter/material.dart';

class MyTextfieldAuth extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final bool isPassword;

  const MyTextfieldAuth({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.isPassword = false, // Default to false
  }) : super(key: key);

  @override
  _MyTextfieldAuthState createState() => _MyTextfieldAuthState();
}

class _MyTextfieldAuthState extends State<MyTextfieldAuth> {
  bool _isObscured = true; // State to track obscure text

  @override
  void initState() {
    super.initState();
    // If it's not a password field, no need to obscure text
    if (!widget.isPassword) {
      _isObscured = false;
    }
  }

  void _toggleObscureText() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText),
        SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.isPassword ? _isObscured : false,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(200, 200, 200, 1)),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade200)),
            fillColor: Colors.white,
            filled: true,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey[500]),
            // Show the toggle icon only if it's a password field
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _isObscured
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: _toggleObscureText,
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
