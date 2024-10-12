import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:storease_mobileapp_dev/api/api_services.dart';
import 'package:storease_mobileapp_dev/method/secure_storage.dart';
import 'package:storease_mobileapp_dev/method/send_whatsapp_message.dart';
import 'package:storease_mobileapp_dev/model/packageResponseModel.dart';
import 'package:storease_mobileapp_dev/screen/components/my_content_homepage_package.dart';
import 'package:storease_mobileapp_dev/screen/package/packageCheckout.dart';
import 'package:storease_mobileapp_dev/screen/vr/vrDisplay.dart';

class PackageDetail extends StatefulWidget {
  final int productID;
  const PackageDetail({required this.productID, super.key});

  @override
  State<StatefulWidget> createState() {
    return _PackageDetailState();
  }
}

class _PackageDetailState extends State<PackageDetail> {
  String phone_number = "+6285895929918";
  late String user_id;

  bool isBookmarked = false;

  // Initialize packages and package as nullable
  List<PackageModel>? packages;
  PackageModel? package;

  bool isLoading = true; // Track the loading state

  @override
  void initState() {
    super.initState();
    _loadUserId();
    _loadPackageByID(widget.productID);
  }

  Future<void> _loadUserId() async {
    String userId =
        await SecureStorage().readSecureData(dotenv.env["KEY_USER_ID"]!);
    setState(() {
      user_id = userId; // Set user ID once retrieved
    });
  }

  Future<void> _loadPackageByID(int id) async {
    ApiServices apiServices = ApiServices();
    try {
      PackageModel fetchedPackage = await apiServices.getPackagByID(id);
      setState(() {
        package = fetchedPackage;
        _loadPackageByCategory(); // Now load related packages by category
      });
    } catch (error) {
      // Handle error here if needed
      setState(() {
        isLoading = false; // Stop loading even if there's an error
      });
    }
  }

  Future<void> _loadPackageByCategory() async {
    ApiServices apiServices = ApiServices();
    try {
      PackageResponseModel packageResponse =
          await apiServices.getPackagByCategory(package!.category);
      setState(() {
        packages = packageResponse.package;
        isLoading = false; // Stop loading after data is fetched
      });
    } catch (error) {
      // Handle error here if needed
      setState(() {
        isLoading = false; // Stop loading even if there's an error
      });
    }
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
                    if (package != null) ...[
                      Container(
                        height: 250, // Set the height for the row of images
                        child: ListView.builder(
                          scrollDirection:
                              Axis.horizontal, // Enables horizontal scrolling
                          itemCount:
                              package!.image_url.length, // Number of images
                          itemBuilder: (context, index) {
                            return Container(
                              width: 150, // Set a width for each image
                              margin: const EdgeInsets.only(
                                  right: 10), // Spacing between images
                              decoration:
                                  BoxDecoration(color: Colors.grey.shade300),
                              child: Image.network(
                                package!.image_url[index],
                                fit: BoxFit.contain,
                              ),
                            );
                          },
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              package!.title,
                              textAlign: TextAlign.center,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          IconButton(
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
                        padding: EdgeInsets.all(5),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Detail",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(package!.description),
                            const SizedBox(height: 10),
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
                              child: Image.asset(
                                  "images/icon_virtual_reality.png"),
                            ),
                            const Text(
                              "Pembayaran",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Text(
                                "* Down Payment: 40%\n* Final Payment: 40%"),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ] else
                      const CircularProgressIndicator(), // Display loader while package is null

                    const SizedBox(height: 10),
                    const Divider(),

                    // Check loading or empty state before displaying packages
                    if (isLoading)
                      const CircularProgressIndicator()
                    else if (packages == null || packages!.isEmpty)
                      const Text("No packages available.")
                    else
                      MyContentHomepagePackage(
                          title: package!.category, packages: packages!, loading: isLoading,),
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
