import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:http/http.dart' as http;
import 'package:storease_mobileapp_dev/api/api_services.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/method/secure_storage.dart';
import 'package:storease_mobileapp_dev/model/profileResponseModel.dart';
import 'package:storease_mobileapp_dev/screen/auth/Login.dart';
import 'package:storease_mobileapp_dev/screen/components/my_button_profile_configure.dart';
import 'package:storease_mobileapp_dev/screen/components/my_button_profile_my_account.dart';
import 'package:storease_mobileapp_dev/screen/order/order.dart';
import 'package:storease_mobileapp_dev/screen/profile/help.dart';
import 'package:storease_mobileapp_dev/screen/profile/history.dart';
import 'package:storease_mobileapp_dev/screen/profile/language.dart';
import 'package:storease_mobileapp_dev/screen/profile/terms_and_condition.dart';
import 'package:storease_mobileapp_dev/screen/profile/wedding_essentials.dart';
import 'package:storease_mobileapp_dev/screen/profile/profile_edit.dart';

class Profil extends StatefulWidget {
  Profil({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfilState();
  }
}

class _ProfilState extends State<Profil> {
  ProfileResponseModel? userData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadUserProfile();
  }

   Future<void> loadUserProfile() async {
    ApiServices apiServices = ApiServices();
    apiServices.getProfile().then((value){
      
    if (value != null && value != null) {
      setState(() {
        userData = value;
        print(userData);
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      // Optionally, handle unauthorized state by redirecting to login
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Login()),
        (Route<dynamic> route) => false,
      );
    }
    });
  }

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
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : userData == null
                ? Center(child: Text("Failed to load profile"))
                : SingleChildScrollView(
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
                                        backgroundImage: userData!.photo_profile != null
                                            ? NetworkImage(userData!.photo_profile)
                                            : AssetImage("images/account_circle_blue.png") as ImageProvider,
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: -25,
                                        child: RawMaterialButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) {
                                                return ProfileEdit();
                                              }),
                                            );
                                          },
                                          elevation: 2.0,
                                          fillColor: Colors.amber,
                                          child: Icon(Icons.edit),
                                          shape: CircleBorder(),
                                        ),
                                      )
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
                                          userData!.name ?? "N/A",
                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "@${userData!.name ?? "N/A"}",
                                          style: TextStyle(color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(),
                          Column(
                            children: [
                              Text("Akun Saya", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 10,
                              ),
                              MyButtonProfileMyAccount(
                                  icon: Icon(Icons.event),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
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
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
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
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
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
                                          onPressed: () async {
                                            await SecureStorage().deleteSecureData("${dotenv.env["KEY_TOKEN"]}");
                                            Navigator.of(context).pop(); // Close the dialog
                                            Navigator.of(context).pushAndRemoveUntil(
                                              MaterialPageRoute(builder: (context) => Login()),
                                              (Route<dynamic> route) => false, // Remove all previous routes
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
                  ),
      ),
    );
  }
}
