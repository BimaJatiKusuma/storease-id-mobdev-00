import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/screen/auth/Login.dart';
import 'package:storease_mobileapp_dev/screen/auth/Signup.dart';
import 'package:storease_mobileapp_dev/screen/components/my_button_auth.dart';
import 'package:storease_mobileapp_dev/screen/components/square_tile_image.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AuthState();
  }
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                          style: TextStyle(fontWeight: FontWeight.bold),
                          "Do You Have Account ?"),
                      SizedBox(
                        height: 50,
                      ),
                      SquareTileImage(
                          imagePath: "images/account_circle_blue.png"),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            Text("I don't have account"),
                          ],
                        ),
                      ),
                      MyButtonAuth(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Signup();
                            }));
                          },
                          label_name: "SIGN UP",
                          boxBorder: Border.all(
                              width: 1, color: Color.fromRGBO(0, 0, 0, 0.16)),
                          backgroundColor: Color.fromRGBO(93, 118, 167, 0),
                          textColor: Colors.black),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            Text("I have account"),
                          ],
                        ),
                      ),
                      MyButtonAuth(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Login();
                            }));
                          },
                          label_name: "SIGN IN",
                          backgroundColor: Color.fromRGBO(93, 118, 167, 1),
                          textColor: Colors.white),
                      Spacer(),
                      Image.asset("images/logo_plus_name.png"),
                      SizedBox(height: 10)
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ));
  }
}
