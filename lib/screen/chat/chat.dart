import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/screen/chat/chat_AI.dart';
import 'package:storease_mobileapp_dev/screen/chat/chat_vendor.dart';

class Chat extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _chatState();
  }
  
}

class _chatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Chat"),
          bottom: TabBar(
            tabs: [
              Tab(text: "Vendor",),
              Tab(text: "AI Wedding Planner",),
            ],
          ),
        ),
        body: TabBarView(children: [
          ChatVendor(),
          ChatAI(),
        ],),
      ),
    );
  }

}