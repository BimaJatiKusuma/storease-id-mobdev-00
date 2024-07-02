import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/screen/components/my_content_chat_vendor_tile.dart';

class ChatAI extends StatefulWidget {
  ChatAI({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ChatAIState();
  }
}

class _ChatAIState extends State<ChatAI> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: double.infinity,
          height: 50,
          child: Text("Chat History", textAlign: TextAlign.left,),
        ),
        MyContentChatVendorTile(),
        MyContentChatVendorTile(),
        MyContentChatVendorTile(),
      ],
    );
  }
}
