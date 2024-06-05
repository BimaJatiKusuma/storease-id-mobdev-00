import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:storease_mobileapp_dev/components/my_content_homepage_vendor.dart';
import 'package:storease_mobileapp_dev/components/my_content_vendor_detail_produk_review_tile.dart';

class Vendor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VendorState();
  }
}

class _VendorState extends State<Vendor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vendor"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      child: Stack(
                        children: [
                          Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: Stack(children: [
                                Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: Image.asset(
                                    "images/venue_image.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  color: Color.fromRGBO(54, 54, 54, 0.5),
                                )
                              ])),
                          Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      width: 50,
                                      height: 50,
                                      child: Image.asset(
                                          "images/account_circle_blue.png")),
                                  Text(
                                    "Name Vendor",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text("Category - City",
                                      style: TextStyle(color: Colors.white)),
                                  Text("\$\$ | Rate 4.8 | 10 Reviews",
                                      style: TextStyle(color: Colors.white))
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 10,
                              right: 10,
                              child: Icon(
                                Icons.bookmark_border,
                                color: Colors.white,
                                size: 30,
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MyContentHomepageVendor(title: "All Product"),
                    SizedBox(
                      height: 10,
                    ),
                    MyContentHomepageVendor(title: "Projects"),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Social Media"),
                    Divider(),
                    Image.asset(
                      "images/icon_instagram.png",
                      height: 30,
                      width: 30,
                    ),
                    Divider(),
                    Text("Info"),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: 75),
                      child: Text(
                          "Ini adlaah text yang sangat panjang dan memiliki \n baris barus dan \n baru \n dan baru"),
                    ),
                    Container(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {}, child: Text("Read more"))),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Reviewed (3)"),
                    VendorDetailProdukReviewTile(),
                    VendorDetailProdukReviewTile(),
                    Divider(),
                    Align(alignment: Alignment.center,child: Text("Read All Reviews (1)", style: TextStyle(fontWeight: FontWeight.bold),))
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: (){}, child: Icon(Icons.call_outlined)),
                  ElevatedButton(onPressed: () {}, child: Text("Pricelist")),
                  ElevatedButton(onPressed: () {}, child: Text("Chat Vendor")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
