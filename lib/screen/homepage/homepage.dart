import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
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
  String id_user = "1234";
  String phone_number = "+6285895929918";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.search),
        title: TextField(
          decoration: InputDecoration(hintText: "Search"),
        ),
        actions: [
          IconButton(onPressed: () {
            sendWhatsAppMessage(id_user, phone_number);
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
