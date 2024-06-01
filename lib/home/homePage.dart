import 'dart:ffi';

import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/components/my_button_auth_2.dart';
import 'package:storease_mobileapp_dev/components/my_button_homepage_vendor.dart';
import 'package:storease_mobileapp_dev/components/my_content_homepage_vendor.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.search),
        title: TextField(
          decoration: InputDecoration(hintText: "Search"),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.chat_bubble_outline)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_outlined))
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "My Vendor Discovery",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ElevatedButton(onPressed: () {}, child: Text("Venue")),
                      ElevatedButton(
                          onPressed: () {}, child: Text("Photography")),
                      ElevatedButton(
                          onPressed: () {}, child: Text("Hair and Make up")),
                      ElevatedButton(onPressed: () {}, child: Text("Catering")),
                      ElevatedButton(
                          onPressed: () {}, child: Text("Souvenirs")),
                    ],
                  ),
                ),
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
              SizedBox(
                height: 60,
                child: Padding(
                  padding: EdgeInsets.only(left:10, bottom: 5, top: 5),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        MyButtonHomepageVendor(
                            icon: Icons.home_outlined,
                            label_name: "Venue",
                            onTap: () {}),
                        MyButtonHomepageVendor(
                            icon: Icons.remove_red_eye_outlined,
                            label_name: "Make up",
                            onTap: () {}),
                        MyButtonHomepageVendor(
                            icon: Icons.camera_alt_outlined,
                            label_name: "Photography",
                            onTap: () {}),
                        MyButtonHomepageVendor(
                            icon: Icons.videocam_outlined,
                            label_name: "Souvenirs",
                            onTap: () {}),
                        MyButtonHomepageVendor(
                            icon: Icons.inventory_2_outlined,
                            label_name: "Invitation",
                            onTap: () {}),
                      ],
                    ),
                  ),
                ),
              ),

              MyContentHomepageVendor(title: "Venue Recommendation"),
              SizedBox(height: 20,),
              MyContentHomepageVendor(title: "Catering Recommendation"),
              SizedBox(height: 20,),
              MyContentHomepageVendor(title: "MUA Recommendation"),
              SizedBox(height: 20,),
              MyContentHomepageVendor(title: "Souvenir Recommendation"),
              SizedBox(height: 20,),
              MyContentHomepageVendor(title: "Invitation Recommendation"),
            ],
          ),
        ),
      )),
    );
  }
}