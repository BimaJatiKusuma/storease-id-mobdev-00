import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/api/api_services.dart';
import 'package:storease_mobileapp_dev/screen/auth/Login.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/screen/components/my_button_auth_2.dart';
import 'package:storease_mobileapp_dev/screen/components/my_button_auth_3.dart';
import 'package:storease_mobileapp_dev/screen/components/my_textfield_auth.dart';
import 'package:storease_mobileapp_dev/screen/components/square_tile_image.dart';
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

  late SignupRequestModel requestModel;

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
    requestModel = SignupRequestModel(
      username: usernameController.text,
      password: passwordController.text,
      phone: phoneController.text,
      email: emailController.text,
      password_confirmation: passwordConfirmationController.text,
    );

    ApiServices apiServices = ApiServices();
    apiServices.signup(requestModel).then((value) {
      if (value.message.isNotEmpty) {
        _showSnackBar('Message: ${value.message}');
        if (value.message == "User registered successfully") {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return Login();
          }));
        }
      } else {
        _showErrorDialog('Failed to connect.');
      }
    }).catchError((error) {
      _showErrorDialog('An error occurred: $error');
    });
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
            child: Column(
              children: [
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(
                              text:
                                  "Selamat datang di Storease! Nikmati fitur kami sepuasnya, klik "),
                          TextSpan(
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                              text: "Masuk ",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Login();
                                  }));
                                }),
                          TextSpan(text: "jika Anda sudah terdaftar.")
                        ])),
                SizedBox(
                  height: 30,
                ),
                MyTextfieldAuth(
                  labelText: "Nama Lengkap",
                  controller: usernameController,
                  hintText: "Masukkan nama lengkap Anda",
                ),
                SizedBox(
                  height: 20,
                ),
                MyTextfieldAuth(
                    labelText: "Alamat E-Mail",
                    controller: emailController,
                    hintText: "Masukkan alamat E-Mail Anda"),
                SizedBox(
                  height: 20,
                ),
                MyTextfieldAuth(
                    labelText: "Kata Sandi",
                    controller: passwordController,
                    hintText: "Masukkan kata sandi"),
                SizedBox(
                  height: 5,
                ),
                MyTextfieldAuth(
                    labelText: "Konfirmasi Kata Sandi",
                    controller: passwordConfirmationController,
                    hintText: "Masukkan ulang kata sandi"),
                SizedBox(
                  height: 5,
                ),
                MyTextfieldAuth(
                    labelText: "Nomor Telefon",
                    controller: phoneController,
                    hintText: "08xx-xxxx-xxxx"),
                SizedBox(
                  height: 30,
                ),
                MyButtonAuth2(
                  onTap: () {
                    signUserUp();
                  },
                  label_name: "DAFTAR",
                  backgroundColor: Colors.white,
                  textColor: Color.fromRGBO(71, 74, 151, 1),
                  boxBorder: Border.all(color: MyColor.color1),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Text("Atau"),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                MyButtonAuth3(
                  onTap: () {
                    // Implement Google Sign-In functionality
                  },
                  label_name: "Daftar Menggunakan Google",
                  backgroundColor: Colors.white,
                  textColor: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
