import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:storease_mobileapp_dev/color/color.dart';

class ChatVendorChatting extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _chatVendorChattingState();
  }
}

class _chatVendorChattingState extends State<ChatVendorChatting> {
  List<Message> message = [
    Message(
        text: "Hallo",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: "Hallo",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: true),
    Message(
        text: "Hallo",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: "Hallo",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: true),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Expanded(
            child: GroupedListView<Message, DateTime>(
              // reverse: true,
              order: GroupedListOrder.ASC,
              useStickyGroupSeparators: true,
              floatingHeader: true,
              padding: EdgeInsets.all(5),
              elements: message,
              groupBy: (message){return DateTime(
                message.date.year,
                message.date.month,
                message.date.day
              );},
              groupHeaderBuilder: (Message message){return SizedBox(
                height: 40,
                child: Center(
                  child: Card(
                    color: MyColor.color1,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        DateFormat.yMMMd().format(message.date),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              );},
              itemBuilder: (context, Message message){
                return Align(
                  alignment: message.isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Card(
                    elevation: 5,
                    child: Padding(padding: EdgeInsets.all(10),
                    child: Text(message.text),),
                  ),
                );
              },
            )
          ),
          Container(
            color: Colors.grey.shade300,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: "Type your message here..."
              ),
              onSubmitted: (text){
                final message = Message(text: text, date: DateTime.now(), isSentByMe: true);
                setState(() {
                  this.message.add(message);
                });
              },
            ),
          )
        ]),
      ),
    );
  }
}

class Message {
  final String text;
  final DateTime date;
  final bool isSentByMe;

  const Message(
      {required this.text, required this.date, required this.isSentByMe});
}
