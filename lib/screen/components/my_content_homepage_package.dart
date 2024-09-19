import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/screen/components/my_content_homepage_package_item.dart';
import 'package:storease_mobileapp_dev/screen/package/packageDetail.dart';

class MyContentHomepagePackage extends StatelessWidget {
  final String title;
  const MyContentHomepagePackage({required this.title, super.key});

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
                Expanded(
                    child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                RichText(
                    text: TextSpan(
                        text: "Lihat Semua",
                        style: TextStyle(
                            color: MyColor.color1,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            //navigate to Package category page
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) {
                            //   return ForgotPassword();
                            // }));
                          })),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            constraints: BoxConstraints(maxHeight: 220),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                MyContentHomepagePackageItem(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PackageDetailProduct();
                  }));
                }),
                MyContentHomepagePackageItem(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PackageDetailProduct();
                  }));
                }),
                MyContentHomepagePackageItem(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PackageDetailProduct();
                  }));
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
