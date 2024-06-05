import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/components/my_starrating.dart';

class MyContentHomepageVendorItem extends StatelessWidget {
  final Function()? onTap;
  const MyContentHomepageVendorItem({
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
            borderRadius: BorderRadius.all(Radius.circular(5))),
        margin: EdgeInsets.only(right: 10),
        width: 150,
        height: 150,
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "images/vendor_image.png",
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, top: 5),
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: MyColor.color1),
                    child: Text(
                      "Bali",
                      style: TextStyle(
                        color: Colors.white,
                          // decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: Text(
                  "Cliff-Edge Cabana di Alila vilas Uluwatu",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
            ),

            Row(children: [
              Expanded(
                  child: Row(
                children: [
                  StarRating(rating: 4.1),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "4.1",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              )),
              Text(
                "(1235)",
                style: TextStyle(fontSize: 10),
              )
            ])
            // Row(
            //   children: [
            //     Icon(Icons.star),
            //     Icon(Icons.star),
            //     Icon(Icons.star),
            //     Icon(Icons.star),
            //     Icon(Icons.star_half),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
