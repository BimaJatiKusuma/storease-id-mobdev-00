import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/components/my_button_homepage_vendor.dart';
import 'package:storease_mobileapp_dev/components/my_button_profile_configure.dart';
import 'package:storease_mobileapp_dev/components/my_button_profile_feature.dart';

class Profil extends StatefulWidget {
  Profil({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfilState();
  }
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        centerTitle: true,
        elevation: 10,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 120,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 25),
                      width: 100,
                      height: 100,
                      child: Image.asset("images/account_circle_blue.png", fit: BoxFit.contain,),
                    ),
                    SizedBox(width: 15,),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Username", style: TextStyle(fontWeight: FontWeight.bold),),
                            RichText(
                                text: TextSpan(
                                    text: "edit profile",
                                    style: TextStyle(
                                        color: MyColor.color1,
                                        decoration: TextDecoration.underline),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        //navigate to edit profile page
                                        // Navigator.push(context,
                                        //     MaterialPageRoute(builder: (context) {
                                        //   return ForgotPassword();
                                        // }));
                                      })),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
              SizedBox(height: 10,),
              SizedBox(
                height: 80,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyButtonProfileFeature(
                        asset: "images/profile_wedding_checklist.svg",
                        label_name: "Wedding checklist",
                        onTap: () {}),
                    MyButtonProfileFeature(
                        asset: "images/profile_history.svg",
                        label_name: "History",
                        onTap: () {}),
                    MyButtonProfileFeature(
                        asset: "images/profile_reviewed.svg",
                        label_name: "Reviewed",
                        onTap: () {}),
                    MyButtonProfileFeature(
                        asset: "images/profile_myorder.svg",
                        label_name: "My Order",
                        onTap: () {}),
                    MyButtonProfileFeature(
                        asset: "images/profile_saved.svg",
                        label_name: "Saved",
                        onTap: () {}),
                  ],
                ),
              ),
              Divider(),
              SizedBox(
                height: 30,
              ),
              MyButtonProfileConfigure(
                  onTap: () {},
                  label_name: "Language",
                  colorBorder: MyColor.color1,
                  textColor: Colors.black),
              SizedBox(
                height: 30,
              ),
              MyButtonProfileConfigure(
                  onTap: () {},
                  label_name: "Support",
                  colorBorder: MyColor.color1,
                  textColor: Colors.black),
              SizedBox(
                height: 30,
              ),
              MyButtonProfileConfigure(
                  onTap: () {},
                  label_name: "Term and Condition",
                  colorBorder: MyColor.color1,
                  textColor: Colors.black),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 200,
                  child: MyButtonProfileConfigure(
                      onTap: () {},
                      label_name: "Logout",
                      colorBorder: Colors.red,
                      textColor: Colors.red)),
            ],
          ),
        ),
      )),
    );
  }
}
