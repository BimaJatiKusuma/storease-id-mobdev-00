import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/screen/components/my_starrating.dart';

class MyContentHomepagePackageItem extends StatelessWidget {
  final Function()? onTap;
  const MyContentHomepagePackageItem({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        margin: EdgeInsets.only(right: 10),
        width: 170,
        child: Column(
          children: [
            Container(
              child: Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "images/package_image.png",
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Text("Storease Wedding Organizer", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10), textAlign: TextAlign.start,)),
            Container(
              width: double.infinity,
              child: Text(
                "Elegant Afair Package | Outdoor Wedding | Paket Pernikahan Kelas A",
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
