import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/auth/Login.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/components/my_button_auth.dart';
import 'package:storease_mobileapp_dev/components/my_button_auth_2.dart';
import 'package:storease_mobileapp_dev/components/my_textfield_auth.dart';
import 'package:storease_mobileapp_dev/components/square_tile_image.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();

  // void signUserIn(){}

  @override
  State<StatefulWidget> createState() {
    return _SignupState();
  }
}

class _SignupState extends State<Signup> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final usernameController = TextEditingController();

  void signUserIn() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Signup"),
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
                SquareTileImage(
                  imagePath: "images/account_circle_blue.png",
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text("Username")]),
                ),
                MyTextfieldAuth(
                    controller: usernameController,
                    hintText: "Username",
                    obscureText: false),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text("Email Address")]),
                ),
                MyTextfieldAuth(
                    controller: emailController,
                    hintText: "Email",
                    obscureText: false),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text("Password")]),
                ),
                MyTextfieldAuth(
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: false),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 30,
                ),
                MyButtonAuth2(
                  onTap: () {},
                  label_name: "SIGNUP",
                  backgroundColor: Colors.white,
                  textColor: Color.fromRGBO(71, 74, 151, 1),
                  boxBorder: Border.all(color: MyColor.color1),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "OR",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset("images/icon_logingoogle.png")),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset("images/icon_logintwitter.png"))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have account?"),
                    SizedBox(
                      width: 5,
                    ),
                    RichText(
                        text: TextSpan(
                            text: "Sign In",
                            style: TextStyle(
                              color: MyColor.color1,
                              decoration: TextDecoration.underline,
                              fontFamily: 'Poppins',
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                //navigate to signin page
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Login();
                                }));
                              })),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Image.asset("images/logo_plus_name.png"),
                SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
