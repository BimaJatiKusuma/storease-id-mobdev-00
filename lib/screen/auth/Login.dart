import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/api/api_services.dart';
import 'package:storease_mobileapp_dev/screen/auth/ForgotPassword.dart';
import 'package:storease_mobileapp_dev/screen/auth/Signup.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/screen/components/my_button_auth_2.dart';
import 'package:storease_mobileapp_dev/screen/components/my_button_auth_3.dart';
import 'package:storease_mobileapp_dev/screen/components/my_textfield_auth.dart';
import 'package:storease_mobileapp_dev/screen/components/square_tile_image.dart';
import 'package:storease_mobileapp_dev/screen/home/home.dart';
import 'package:storease_mobileapp_dev/model/loginRequestModel.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  List<dynamic> users = [];
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late LoginRequestModel requestModel;

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

  void signUserIn() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
    // requestModel = LoginRequestModel(
    //     password: passwordController.text, username: emailController.text);

    // ApiServices apiServices = ApiServices();
    // apiServices.login(requestModel).then((value) {
    //   if (value.token.isNotEmpty) {
    //     _showSnackBar('Token: ${value.token}');
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => Home()),
    //     );
    //   } else {
    //     _showErrorDialog(value.message);
    //   }
    // }).catchError((error) {
    //   _showErrorDialog('An error occurred: $error');
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Masuk Akun"),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
                                  "Selamat Datang kembali! Masuk untuk melanjutkan, atau "),
                          TextSpan(
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                              text: "Daftar ",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Signup();
                                  }));
                                }),
                          TextSpan(text: "jika Anda pengguna baru")
                        ])),
                SizedBox(height: 50,),
                MyTextfieldAuth(
                    labelText: "Alamat E-mail",
                    controller: emailController,
                    hintText: "Email",
                    obscureText: false),
                SizedBox(
                  height: 20,
                ),
                MyTextfieldAuth(
                    labelText: "Kata Sandi",
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: false),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: "Lupa Kata Sandi",
                              style: TextStyle(
                                  color: Colors.red,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  //navigate to change password page
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return ForgotPassword();
                                  }));
                                })),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                MyButtonAuth2(
                  onTap: () {
                    signUserIn();
                  },
                  label_name: "LOGIN",
                  backgroundColor: Colors.white,
                  textColor: Color.fromRGBO(71, 74, 151, 1),
                  boxBorder: Border.all(color: MyColor.color1),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Text("Atau"),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                MyButtonAuth3(
                    onTap: () {},
                    label_name: "Masuk Menggunakan Google",
                    backgroundColor: Colors.white,
                    textColor: Colors.grey)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
