import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/model/packageResponseModel.dart';
import 'package:storease_mobileapp_dev/screen/components/my_content_homepage_package_item.dart';
import 'package:storease_mobileapp_dev/screen/homepage/list_package.dart';
import 'package:storease_mobileapp_dev/screen/package/packageDetail.dart';

class MyContentHomepagePackage extends StatelessWidget {
  final String title;
  final List<PackageModel>? packages;
  const MyContentHomepagePackage({required this.packages,required this.title, super.key});

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
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ListPackage(
                                title_list: title,
                              );
                            }));
                          })),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            constraints: BoxConstraints(maxHeight: 250),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                MyContentHomepagePackageItem(
                  package: packages![0],
                  onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PackageDetail();
                  }));
                }),
                MyContentHomepagePackageItem(
                  package: packages![1],
                  onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PackageDetail();
                  }));
                }),
                MyContentHomepagePackageItem(
                  package: packages![2],
                  onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PackageDetail();
                  }));
                }),
                Container(
                    child: Column(
                  children: [
                    Text("Lihat Lainnya"),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return ListPackage(
                              title_list: title,
                            );
                          }),
                        );
                      },
                      child: Icon(Icons.arrow_forward_ios),
                    )
                  ],
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
