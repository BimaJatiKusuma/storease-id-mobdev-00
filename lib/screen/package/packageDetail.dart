import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
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

  PackageModel? package;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.wait([
      _loadUserId(),
      _loadPackageByID(widget.productID),
    ]);
  }

  // Helper method to safely call setState
  void safeSetState(VoidCallback fn) {
    if (mounted) {
      setState(fn);
    }
  }

  Future<void> _loadUserId() async {
    try {
      String userId =
          await SecureStorage().readSecureData(dotenv.env["KEY_USER_ID"]!);
      safeSetState(() {
        user_id = userId; // Set user ID once retrieved
      });
    } catch (error) {
      // Handle error if needed
      // Optionally, show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load user ID: $error')),
      );
    } finally {
      // Check if package has also loaded
      safeSetState(() {
        isLoading = !(package != null && user_id.isNotEmpty);
      });
    }
  }

  Future<void> _loadPackageByID(int id) async {
    ApiServices apiServices = ApiServices();
    try {
      PackageDetailResponseModel fetchedPackage =
          await apiServices.getPackagByID(id);
      safeSetState(() {
        package = fetchedPackage.package;
      });
    } catch (error) {
      // Handle error here if needed
      // Optionally, show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load package: $error')),
      );
    } finally {
      // Check if user ID has also loaded
      safeSetState(() {
        isLoading = !(package != null && user_id.isNotEmpty);
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
    // Optionally, handle the case where 'package' is null but 'isLoading' is false
    if (!isLoading && package == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Detail Produk"),
        ),
        body: Center(
          child: Text("Failed to load package details."),
        ),
      );
    }

    final currencyFormatter = NumberFormat.currency(
      locale: 'id_ID', // Indonesian locale
      symbol: 'Rp. ', // Currency symbol
      decimalDigits: 0, // No decimal places
    );
    double value = (package?.price != null && package!.price.isNotEmpty) 
    ? double.parse(package!.price) 
    : 0.0;


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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: ShimmerSkeleton(
                                      width: 150,
                                    ),
                                  );
                                },
                              )
                            : ListView.builder(
                                scrollDirection: Axis
                                    .horizontal, // Enables horizontal scrolling
                                itemCount: package?.image_url.length ??
                                    0, // Number of images
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: MediaQuery.of(context)
                                        .size
                                        .width, // Set a width for each image
                                    margin: const EdgeInsets.only(
                                        right: 10), // Spacing between images
                                    decoration:
                                        BoxDecoration(color: Colors.white),
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
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
                                          currencyFormatter.format(value),
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
                                            package?.title ?? 'N/A',
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ),
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Html(
                                    data: package?.description ??
                                        'No description available.',
                                    style: {
                                      "p": Style(
                                        fontSize: FontSize(16.0),
                                        margin:
                                            Margins.symmetric(vertical: 4.0),
                                      ),
                                      "b": Style(
                                          fontSize: FontSize(16.0),
                                          fontWeight: FontWeight.bold)
                                      // You can add more styling for different HTML tags if needed
                                    },
                                    // onLinkTap:
                                    //     (url, context, attributes, element) {
                                    //   // Handle link taps if your HTML contains links
                                    //   if (url != null) {
                                    //     launchUrl(Uri.parse(
                                    //         url)); // You might need to use url_launcher package
                                    //   }
                                    // },
                                  ),
                                  // Text(package?.description ?? 'No description available.'),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Preview",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                          : Container(
                              // child:Text(
                              //   "MyContentHomepagePackage still on dev",
                              // ),
                              )
                      // : MyContentHomepagePackage(
                      //     // packageCategory: PackageCategoryModel(
                      //     //     id: 1,
                      //     //     name: "Gold",
                      //     //     packages: <PackageModel>[
                      //     //       PackageModel(
                      //     //           description: "description",
                      //     //           id: 1,
                      //     //           category: "1",
                      //     //           price: "75000",
                      //     //           title: "test",
                      //     //           thumbnail_url:
                      //     //               "https://be.storease.id/media/12/Picsart_24-09-22_20-24-35-386.jpg",
                      //     //           image_url: <String>[
                      //     //             "https://be.storease.id/media/12/Picsart_24-09-22_20-24-35-386.jpg",
                      //     //             "https://be.storease.id/media/13/Food-Truck-(HD).png",
                      //     //             "https://be.storease.id/media/14/Food-Truck.png"
                      //     //           ])
                      //     //     ]),
                      //     title: package!.category,
                      //     packages: packages!,
                      //     loading: isLoading,
                      //   ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(color: MyColor.colorSecondary),
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
                        if (package != null) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return PackageCheckout(
                              id: package!.id,
                            );
                          }));
                        } else {
                          // Optionally, show an error message
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Package data not available.')),
                          );
                        }
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
