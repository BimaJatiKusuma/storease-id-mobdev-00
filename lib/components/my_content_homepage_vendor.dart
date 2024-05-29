import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/components/my_content_homepage_vendor_item.dart';

class MyContentHomepageVendor extends StatelessWidget {
  final String title;
  const MyContentHomepageVendor({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Expanded(child: Text(title, style: TextStyle(fontWeight: FontWeight.bold),)),
                RichText(
                    text: TextSpan(
                        text: "Lihat Semua",
                        style: TextStyle(
                            color: MyColor.color1,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            //navigate to Vendor category page
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) {
                            //   return ForgotPassword();
                            // }));
                          })),
              ],
            ),
          ),
      
          SizedBox(
            height: 175,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                MyContentHomepageVendorItem(onTap: (){}),
                MyContentHomepageVendorItem(onTap: (){}),
                MyContentHomepageVendorItem(onTap: (){}),
              ],
            ),
          )
        ],
      ),
    );
  }
}
