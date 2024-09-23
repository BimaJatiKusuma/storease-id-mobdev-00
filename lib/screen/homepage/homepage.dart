import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/screen/components/my_content_homepage_Package.dart';

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
          IconButton(onPressed: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context){
            //   return Chat();
            // }));
          }, icon: Icon(Icons.chat_bubble_outline)),
          IconButton(onPressed: (){}, icon: Image.asset("images/Ai.png")),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_outlined))
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
