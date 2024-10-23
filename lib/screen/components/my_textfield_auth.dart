import 'package:flutter/material.dart';

class MyTextfieldAuth extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final bool isPassword;
  final String? regex;
  final String? errorMessage;
  final bool isRequired;
  final TextInputType inputType; // New inputType field

  const MyTextfieldAuth({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.isPassword = false,
    this.regex,
    this.errorMessage,
    this.isRequired = false,
    this.inputType = TextInputType.text, // Default input type is text
  }) : super(key: key);

  @override
  _MyTextfieldAuthState createState() => _MyTextfieldAuthState();
}

class _MyTextfieldAuthState extends State<MyTextfieldAuth> {
  bool _isObscured = true;

  @override
  void initState() {
    super.initState();
    if (!widget.isPassword) {
      _isObscured = false;
    }
  }

  void _toggleObscureText() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  String? _validateInput(String? value) {
    // Check if the field is required and empty
    if (widget.isRequired && (value == null || value.isEmpty)) {
      return 'Harap isi halaman ini';
    }
    // Check if a regex is provided and if the input matches
    if (widget.regex != null && value != null && !RegExp(widget.regex!).hasMatch(value)) {
      return widget.errorMessage ?? "Jawaban tidak valid";
    }
    return null;
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
          keyboardType: widget.inputType, // Use the inputType here
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(200, 200, 200, 1)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey[500]),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _isObscured ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: _toggleObscureText,
                  )
                : null,
          ),
          validator: _validateInput, // Call validation method
        ),
      ],
    );
  }
}
