import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/method/send_whatsapp_message.dart';
import 'package:storease_mobileapp_dev/screen/components/my_content_homepage_package.dart';
import 'package:storease_mobileapp_dev/screen/package/packageCheckout.dart';
import 'package:storease_mobileapp_dev/screen/vr/vrDisplay.dart';

class PackageDetail extends StatefulWidget {
  const PackageDetail({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PackageDetailState();
  }
}

class _PackageDetailState extends State<PackageDetail> {
  String phone_number = "+6285895929918";
  String user_id = "23232";

  // Variable to track bookmark state
  bool isBookmarked = false;

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
                    Row(
                      children: [
                        Expanded(
                          child: const Text(
                            textAlign: TextAlign.center,
                            "The Amaryllis Boutique Resort",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ), 
                        ),
                        IconButton(
                          // IconButton for bookmarking
                          onPressed: () {
                            setState(() {
                              isBookmarked =
                                  !isBookmarked; // Toggle bookmark state
                            });
                          },
                          icon: Icon(
                            isBookmarked
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                            color: isBookmarked ? Colors.blue : Colors.grey,
                          ),
                        ),
                      ],
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
                              "Wedding organizer by Storease \n- Konsultasi konsep acara wedding (resepsi)\n- Konsep wedding \n- Rundown wedding\n- 1 x visit venue\n- 3x meeting (client, keluarga, all vendor/final)\n- Manage vendor installation( loading catering sound, decoration)\n- 1 project Manager 4 crew\n- Undangan digital\n\nDécor by Yulis\n- Dekorasi saat akad nikah (meja + kursi akad) 4 x 4\n- Backdrop \n- Dekorasi bunga\n- Welcome sign\n- Kotak uang 2\n- Hand bouquet fresh flower\n- Dekor pintu masuk\n\nMUA & Dress by Kholid\n  Makeup kedua mempelai\n- 1 busana akad\n- 1 busana temu tamu\n- 1 busana resepsi\n- Melati akad non adat \n- Softlens normal\n- Henna tangan\n- Nail art\n\nDokumentasi By Dig Studio\n- Unlimited photo +/- 4 jam\n- Weeding box 50 pages\n- 1 photo printed 16 Rs (40 x 60 Cm)\n- 1 big frame 16 Rs\n- 1 photographer\n- File in flash disk"),
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
                            "* Down Payment: 40%\n* Pembayaran Kedua: 40%\nPembayaran Terakhir: 20%",
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
                  onPressed: () {
                    sendWhatsAppMessage(user_id, phone_number);
                  },
                  child: const Text("Chat"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
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
