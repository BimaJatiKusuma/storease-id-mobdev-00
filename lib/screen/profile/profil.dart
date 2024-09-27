import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/screen/auth/Login.dart';
import 'package:storease_mobileapp_dev/screen/components/my_button_profile_configure.dart';
import 'package:storease_mobileapp_dev/screen/components/my_button_profile_feature.dart';
import 'package:storease_mobileapp_dev/screen/profile/help.dart';
import 'package:storease_mobileapp_dev/screen/profile/history.dart';
import 'package:storease_mobileapp_dev/screen/components/my_button_profile_my_account.dart';
import 'package:storease_mobileapp_dev/screen/profile/language.dart';
import 'package:storease_mobileapp_dev/screen/profile/terms_and_condition.dart';
import 'package:storease_mobileapp_dev/screen/profile/wedding_essentials.dart';
import 'package:storease_mobileapp_dev/screen/profile/profile_edit.dart';
import 'package:storease_mobileapp_dev/screen/order/order.dart';

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
                height: 100,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      width: 100,
                      height: 100,
                      child: Stack(
                        clipBehavior: Clip.none,
                        fit: StackFit.expand,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("images/account_circle_blue.png"),
                          ),
                          Positioned(
                              bottom: 0,
                              right: -25,
                              child: RawMaterialButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return ProfileEdit();
                                  }));
                                },
                                elevation: 2.0,
                                fillColor: Colors.amber,
                                child: Icon(Icons.edit),
                                shape: CircleBorder(),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Muhammad Amazon",
                            ),
                            Text(
                              "@Amazon24",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // SizedBox(
              //   height: 20,
              // ),
              Divider(),
              // SizedBox(
              //   height: 10,
              // ),
              Column(
                children: [
                  Text("Akun Saya"),
                  SizedBox(
                    height: 10,
                  ),
                  MyButtonProfileMyAccount(
                      icon: Icon(Icons.event),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return WeddingEssentials();
                        }));
                      },
                      title: "Kelengkapan Pernikahan"),
                  SizedBox(
                    height: 10,
                  ),
                  MyButtonProfileMyAccount(
                      icon: Icon(Icons.shopping_bag_outlined),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Order();
                        }));
                      },
                      title: "Pesanan Saya"),
                  SizedBox(
                    height: 10,
                  ),
                  MyButtonProfileMyAccount(
                      icon: Icon(Icons.history),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return History();
                        }));
                      },
                      title: "Riwayat"),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              Divider(),
              SizedBox(
                height: 30,
              ),
              MyButtonProfileConfigure(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Language();
                    }));
                  },
                  label_name: "Bahasa",
                  colorBorder: MyColor.color1,
                  textColor: Colors.black),
              SizedBox(
                height: 30,
              ),            
              MyButtonProfileConfigure(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Help();
                    }));
                  },
                  label_name: "Bantuan",
                  colorBorder: MyColor.color1,
                  textColor: Colors.black),
              SizedBox(
                height: 30,
              ),
              MyButtonProfileConfigure(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return TermsAndcondition();
                    }));
                  },
                  label_name: "Syarat Dan Ketentuan",
                  colorBorder: MyColor.color1,
                  textColor: Colors.black),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 200,
                child: MyButtonProfileConfigure(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Keluar Akun"),
                          content: Text("Apakah Anda yakin ingin keluar akun?"),
                          actions: <Widget>[
                            TextButton(
                              child: Text("Batal"),
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                            ),
                            TextButton(
                              child: Text("Keluar"),
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => Login()),
                                  (Route<dynamic> route) =>
                                      false, // Remove all previous routes
                                );
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  label_name: "Keluar Akun",
                  colorBorder: Colors.red,
                  textColor: Colors.red,
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
