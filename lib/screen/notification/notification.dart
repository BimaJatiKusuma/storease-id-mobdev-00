import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/screen/notification/notificationDetail.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifikasi"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return NotificationDetail();
                }));
              },
              child: Container(
                width: double.infinity,
                child: Row(
                  children: [
                    // Container(
                    //   width: 75,
                    //   height: 75,
                    //   child: Image.asset("account_circle_blue.png"),
                    // ),
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(child: Text("Storease")),
                            Text("Jan 2, 2024, 10.000"),
                            Icon(Icons.circle)
                          ],
                        ),
                        Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam in ligula in velit hendrerit malesuada. Donec lacinia quam a libero aliquet, quis fringilla nisi rhoncus.",
                            softWrap: true,
                            maxLines: 2,
                            )
                      ],
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
