import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/screen/chat/chat_vendor_chatting.dart';

class MyContentChatVendorTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(left: 5, right: 5),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return ChatVendorChatting();
          }));
        },
        child: Row(
          children: [
            Container(
              width: 60,
              child: Image.asset("images/account_circle_blue.png"),
              padding: EdgeInsets.all(5),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Text(
                      "@vendor | Bogor",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                      "Halo selamat siang, terima kasih sudah menghubungi kami, silakan tulis pesan anda, kami akan membalas secepat mungkin yang kami bisa",
                      maxLines: 2, overflow: TextOverflow.ellipsis,)
                ],
              ),
            ),
            Container(
              width: 20,
              child: Stack(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(color: MyColor.color1),
                  ),
                  Container(
                    width: double.infinity,
                      child: Text(
                    "1",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
