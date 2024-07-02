import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/screen/components/my_content_chat_vendor_tile.dart';

class ChatVendor extends StatefulWidget{
  ChatVendor({super.key});
  @override
  State<StatefulWidget> createState() {
    return _chatVendorState();
  }
  
}

class _chatVendorState extends State<ChatVendor> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 50,
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search vendor chat",
              prefixIcon: Icon(Icons.search)
            ),
          ),
        ),
        MyContentChatVendorTile(),
        MyContentChatVendorTile(),
        MyContentChatVendorTile(),
      ],
    );
  }
}