import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/components/my_content_homepage_vendor.dart';
import 'package:storease_mobileapp_dev/components/my_content_vendor_detail_produk_review_tile.dart';
import 'package:storease_mobileapp_dev/vendor/vendor.dart';
import 'package:storease_mobileapp_dev/vr/vrDisplay.dart';

class VendorDetailProduct extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VendorDetailProductState();
  }
}

class _VendorDetailProductState extends State<VendorDetailProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Produk"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.grey.shade300),
                    height: 200,
                    child: Image.asset(
                      "images/venue_image.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 50,
                    ),
                    child: Text(
                      "The Amaryllis Boutique Resort",
                      style: TextStyle(fontWeight: FontWeight.bold), softWrap: true, overflow: TextOverflow.ellipsis, maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.grey.shade200),
                    height: 100,
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          child: Image.asset("images/account_circle_blue.png"),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(child: Text("[Nama Vendor]", style: TextStyle(fontWeight: FontWeight.bold)), alignment: Alignment.topLeft,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("123 produk"),
                                Text("4.8 penilaian")
                              ],
                            )
                          ],
                        )),
                        SizedBox(width: 10,),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return Vendor();
                            }));
                          },
                          child: Text("Kunjungi Vendor"),
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.only(
                                  top: 0, bottom: 0, left: 5, right: 5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Detail",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            "Ini adalah detail dari produk yang berisi deskripsi mendalam. \n Ini adalah list 1\nlist 2\nini adalah deskripsi yang bisa diberikan oleh vendor"),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Pembayaran",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            "* Down Payment: 40%\n*Pembayaran Kedua: 40%\nPembayaran Terakhir: 20%"),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Preview",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return VRDisplay();
                          }));
                        }, child: Image.asset("images/icon_virtual_reality.png"),)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Reviewed (3)"),
                            RichText(
                                text: TextSpan(
                                    text: "Lihat semua...",
                                    style: TextStyle(
                                      color: MyColor.color1,
                                      decoration: TextDecoration.underline,
                                      fontFamily: 'Poppins',
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        //navigate to all review page
                                      })),
                          ],
                        ),
                        Divider(),
                        VendorDetailProdukReviewTile(),
                        SizedBox(height: 10,),
                        Divider(),
                        MyContentHomepageVendor(title: "Other"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: () {}, child: Text("Pricelist")),
                ElevatedButton(onPressed: () {}, child: Text("Chat Vendor")),
              ],
            ),
          )
        ],
      )),
    );
  }
}

