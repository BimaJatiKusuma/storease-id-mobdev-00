import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/screen/components/my_content_homepage_package.dart';
import 'package:storease_mobileapp_dev/screen/components/my_content_package_detail_produk_review_tile.dart';
import 'package:storease_mobileapp_dev/screen/package/packageCheckout.dart';
import 'package:storease_mobileapp_dev/screen/vr/vrDisplay.dart';

class PackageDetailProduct extends StatefulWidget {
  const PackageDetailProduct({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PackageDetailProductState();
  }
}

class _PackageDetailProductState extends State<PackageDetailProduct> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Produk"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
                    const SizedBox(
                      height: 10,
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxHeight: 50,
                      ),
                      child: const Text(
                        "The Amaryllis Boutique Resort",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(color: Colors.grey.shade200),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Detail",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "Ini adalah detail dari produk yang berisi deskripsi mendalam. \n Ini adalah list 1\nlist 2\nini adalah deskripsi yang bisa diberikan oleh Package",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Preview",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return VRDisplay();
                              }));
                            },
                            child:
                                Image.asset("images/icon_virtual_reality.png"),
                          ),
                          const Text(
                            "Pembayaran",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "* Down Payment: 40%\n*Pembayaran Kedua: 40%\nPembayaran Terakhir: 20%",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    const MyContentHomepagePackage(title: "Paket Lainnya"),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Chat"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return PackageCheckout();
                    }));
                  },
                  child: const Text("Buat Pesanan"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
