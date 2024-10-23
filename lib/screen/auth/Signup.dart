import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/api/api_services.dart';
import 'package:storease_mobileapp_dev/screen/auth/Login.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/screen/components/my_button_auth_3.dart';
import 'package:storease_mobileapp_dev/screen/components/my_textfield_auth.dart';
import 'package:storease_mobileapp_dev/model/signupRequestModel.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignupState();
  }
}

class _SignupState extends State<Signup> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>(); // Key to track form state

  late SignupRequestModel requestModel;
  bool _isLoading = false; // Track loading state

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void signUserUp() {
    if (_formKey.currentState?.validate() == true) { // Trigger validation
      setState(() {
        _isLoading = true;
      });
      requestModel = SignupRequestModel(
        username: usernameController.text,
        password: passwordController.text,
        address: addressController.text,
        phone: phoneController.text,
        email: emailController.text,
        password_confirmation: passwordConfirmationController.text,
      );

      ApiServices apiServices = ApiServices();
      apiServices.signup(requestModel).then((value) {
        setState(() {
          _isLoading = false;
        });
        if (value.message == "register success") {
          _showSnackBar('Message: ${value.message}');
          Navigator.pop(context);
        } else {
          _showErrorDialog('Failed to connect.');
          setState(() {
            _isLoading = false;
          });
        }
      }).catchError((error) {
        _showErrorDialog('An error occurred: $error');
        setState(() {
          _isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Daftar"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: AbsorbPointer(
              absorbing: _isLoading,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Form( // Wrap in Form widget
                  key: _formKey, // Assign the form key
                  child: Column(
                    children: [
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style: TextStyle(color: Colors.grey),
                              children: [
                                TextSpan(
                                    text: "Selamat datang di Storease! Nikmati fitur kami sepuasnya, klik "),
                                TextSpan(
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                    text: "Masuk ",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pop(context);
                                      }),
                                TextSpan(text: "jika Anda sudah terdaftar.")
                              ])),
                      SizedBox(
                        height: 30,
                      ),
                      MyTextfieldAuth(
                        labelText: "Nama Lengkap",
                        inputType: TextInputType.name,
                        controller: usernameController,
                        hintText: "Masukkan nama lengkap Anda",
                        isRequired: true, // Mark as required
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyTextfieldAuth(
                        labelText: "Alamat E-Mail",
                        controller: emailController,
                        inputType: TextInputType.emailAddress,
                        hintText: "Masukkan alamat E-Mail Anda",
                        regex: r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$', // Email regex pattern
                        errorMessage: "Masukkan alamat email yang valid",
                        isRequired: true, // Mark as required
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyTextfieldAuth(
                        labelText: "Nomor Telepon",
                        controller: phoneController,
                        regex: r'^\d{12,}$',
                        inputType: TextInputType.phone,
                        errorMessage: "Maskkan 12 Digit nomor telepon",
                        hintText: "08xxxxxxxxxx",
                        isRequired: true, // Mark as required
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyTextfieldAuth(
                        labelText: "Alamat",
                        inputType: TextInputType.streetAddress,
                        controller: addressController,
                        hintText: "Jl. Nasional No. 03, Sumbersari, Jember, Jawa Timur",
                        isRequired: true, // Mark as required
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyTextfieldAuth(
                        labelText: "Kata Sandi",
                        controller: passwordController,
                        isPassword: true,
                        hintText: "Masukkan kata sandi",
                        isRequired: true, // Mark as required
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      MyTextfieldAuth(
                        labelText: "Konfirmasi Kata Sandi",
                        controller: passwordConfirmationController,
                        isPassword: true,
                        hintText: "Masukkan ulang kata sandi",
                        isRequired: true, // Mark as required
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: _isLoading ? null : signUserUp, // Call signUserUp
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(color: MyColor.color1),
                          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: _isLoading
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                "DAFTAR",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
