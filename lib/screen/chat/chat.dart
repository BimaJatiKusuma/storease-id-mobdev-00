import 'package:flutter/material.dart';

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
              Tab(text: "Package",),
              Tab(text: "AI Wedding Planner",),
            ],
          ),
        ),
        body: ElevatedButton(onPressed: (){}, child: Text(
          "Ini akan mengarah ke whatsapp"
        ))
      ),
    );
  }

}