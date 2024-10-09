import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/api/api_services.dart';
import 'package:storease_mobileapp_dev/method/send_whatsapp_message.dart';
import 'package:storease_mobileapp_dev/model/packageResponseModel.dart';
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
  
  bool isBookmarked = false;
  
  // Initialize packages as an empty list
  List<PackageModel> packages = [];
  
  bool isLoading = true; // Track the loading state

  @override
  void initState() {
    super.initState();
    _loadPackageByCategory();
  }

  Future<void> _loadPackageByCategory() async {
    ApiServices apiServices = ApiServices();
    apiServices.getPackagByCategory("beauty").then((value) {
      setState(() {
        packages = value.package;
        isLoading = false; // Stop loading after data is fetched
      });
    }).catchError((error) {
      // Handle error here if needed
      setState(() {
        isLoading = false; // Stop loading even if there's an error
      });
    });
  }

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
                        const Expanded(
                          child: Text(
                            textAlign: TextAlign.center,
                            "The Amaryllis Boutique Resort",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isBookmarked = !isBookmarked; // Toggle bookmark state
                            });
                          },
                          icon: Icon(
                            isBookmarked ? Icons.bookmark : Icons.bookmark_border,
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
                          const Text("Wedding organizer by Storease..."), // Truncated for brevity
                          const SizedBox(height: 10),
                          const Text(
                            "Preview",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return VRDisplay();
                              }));
                            },
                            child: Image.asset("images/icon_virtual_reality.png"),
                          ),
                          const Text(
                            "Pembayaran",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text("* Down Payment: 40%\n* Pembayaran Kedua: 40%\nPembayaran Terakhir: 20%"),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(),

                    // Check loading or empty state before displaying packages
                    if (isLoading)
                      const CircularProgressIndicator()
                    else if (packages.isEmpty)
                      const Text("No packages available.")
                    else
                      MyContentHomepagePackage(title: "Paket Lainnya", packages: packages),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
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
