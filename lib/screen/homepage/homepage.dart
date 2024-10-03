import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/method/secure_storage.dart';
import 'package:storease_mobileapp_dev/screen/ai/ai.dart';
import 'package:storease_mobileapp_dev/screen/components/my_content_homepage_Package.dart';
import 'package:storease_mobileapp_dev/screen/notification/notification.dart';

import '../../method/send_whatsapp_message.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  String? idUser; // State variable for user ID
  String phoneNumber = "+6285895929918";

  @override
  void initState() {
    super.initState();
    _loadUserId(); // Fetch user ID on initialization
  }

  Future<void> _loadUserId() async {
    String? userId = await SecureStorage().readSecureData(dotenv.env["KEY_USER_ID"]!);
    setState(() {
      idUser = userId; // Set user ID once retrieved
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("images/logo_white.png"),
        title:
        Text("STOREASE", style: TextStyle(fontWeight: FontWeight.bold),),
        // TextField(
        //   decoration: InputDecoration(hintText: "Search"),
        // ),
        actions: [
          IconButton(onPressed: () {
            sendWhatsAppMessage(idUser!, phoneNumber);
          }, icon: Icon(Icons.chat_bubble_outline)),
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return AIPage();
            }));
          }, icon: Image.asset("images/Ai.png")),
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return NotificationPage();
            }));
          }, icon: Icon(Icons.notifications_outlined))
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 150,
                width: double.infinity,
                child: AnotherCarousel(
                  images: [
                    AssetImage("images/banner.png"),
                    AssetImage("images/banner.png"),
                    AssetImage("images/banner.png"),
                  ],
                  dotSize: 6,
                  indicatorBgPadding: 5.0,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Divider(
                    color: MyColor.color1,
                  )),
              MyContentHomepagePackage(title: "Paket Tipe A"),
              SizedBox(
                height: 20,
              ),
              MyContentHomepagePackage(title: "Paket Tipe B"),
              SizedBox(
                height: 20,
              ),
              MyContentHomepagePackage(title: "Paket Tipe C"),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
