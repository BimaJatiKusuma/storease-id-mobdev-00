import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:storease_mobileapp_dev/api/api_services.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/method/secure_storage.dart';
import 'package:storease_mobileapp_dev/method/send_whatsapp_message.dart';
import 'package:storease_mobileapp_dev/model/packageResponseModel.dart';
import 'package:storease_mobileapp_dev/screen/components/my_content_homepage_package.dart';
import 'package:storease_mobileapp_dev/screen/components/shimmer_skeleton.dart';
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
  late PackageModel package;

  bool isLoading = true; // Track the loading state

  @override
  void initState() {
    super.initState();
    _loadUserId();
    _loadPackageByID(widget.productID);
  }

  // Helper method to safely call setState
  void safeSetState(VoidCallback fn) {
    if (mounted) {
      setState(fn);
    }
  }

  Future<void> _loadUserId() async {
    try {
      String userId = await SecureStorage().readSecureData(dotenv.env["KEY_USER_ID"]!);
      safeSetState(() {
        user_id = userId; // Set user ID once retrieved
      });
    } catch (error) {
      // Handle error if needed
      safeSetState(() {
        isLoading = false; // Stop loading even if there's an error
      });
    }
  }

  Future<void> _loadPackageByID(int id) async {
    ApiServices apiServices = ApiServices();
    try {
      PackageModel fetchedPackage = await apiServices.getPackagByID(id);
      safeSetState(() {
        package = fetchedPackage;
      });
      await _loadPackageByCategory(); // Await to ensure sequence
    } catch (error) {
      // Handle error here if needed
      safeSetState(() {
        isLoading = false; // Stop loading even if there's an error
      });
    }
  }

  Future<void> _loadPackageByCategory() async {
    ApiServices apiServices = ApiServices();
    try {
      PackageResponseModel packageResponse =
          await apiServices.getPackagByCategory(package!.category);
      safeSetState(() {
        packages = packageResponse.package;
        isLoading = false; // Stop loading after data is fetched
      });
    } catch (error) {
      // Handle error here if needed
      safeSetState(() {
        isLoading = false; // Stop loading even if there's an error
      });
    }
  }

  @override
  void dispose() {
    // Clean up any controllers, streams, etc., if added in the future
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Produk"),
      ),
      body: SafeArea(
        child: AbsorbPointer(
          absorbing: isLoading,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Container(
                        height: 300, // Set the height for the row of images
                        child: isLoading
                            ? ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 10),
                                    child: ShimmerSkeleton(
                                      width: 150,
                                    ),
                                  );
                                })
                            : ListView.builder(
                                scrollDirection: Axis.horizontal, // Enables horizontal scrolling
                                itemCount: package!.image_url.length, // Number of images
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width, // Set a width for each image
                                    margin: const EdgeInsets.only(
                                        right: 10), // Spacing between images
                                    decoration: BoxDecoration(
                                        color: Colors.white),
                                    child: Image.network(
                                      package!.image_url[index],
                                      fit: BoxFit.contain,
                                    ),
                                  );
                                },
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: isLoading
                            ? ShimmerSkeleton(width: double.infinity)
                            : Container(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  // borderRadius: BorderRadius.circular(10)
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Rp. ${package!.price}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const Divider(height: 0),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            package!.title,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ),
                                        // Uncomment if needed
                                        // IconButton(
                                        //   onPressed: () {
                                        //     safeSetState(() {
                                        //       isBookmarked = !isBookmarked; // Toggle bookmark state
                                        //     });
                                        //   },
                                        //   icon: Icon(
                                        //     isBookmarked
                                        //         ? Icons.bookmark
                                        //         : Icons.bookmark_border,
                                        //     color: isBookmarked ? Colors.blue : Colors.grey,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      isLoading
                          ? const ShimmerSkeleton(
                              height: 300,
                              width: double.infinity,
                            )
                          : Container(
                              padding: const EdgeInsets.all(5),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
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
                                      "* Down Payment: 60%\n* Final Payment: 40%"),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),

                      const SizedBox(height: 10),
                      const Divider(),

                      isLoading
                          ? const ShimmerSkeleton(
                              width: double.infinity,
                              height: 60,
                            )
                          : MyContentHomepagePackage(
                              title: package!.category,
                              packages: packages!,
                              loading: isLoading,
                            ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(color:MyColor.colorSecondary),
                child: Row(
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
                          return PackageCheckout(id: package.id,);
                        }));
                      },
                      child: const Text("Buat Pesanan"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
