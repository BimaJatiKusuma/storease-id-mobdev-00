import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:storease_mobileapp_dev/api/api_services.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/method/secure_storage.dart';
import 'package:storease_mobileapp_dev/model/packageResponseModel.dart';
import 'package:storease_mobileapp_dev/screen/components/my_content_homepage_package.dart';
import 'package:storease_mobileapp_dev/screen/components/shimmer_skeleton.dart';
import 'package:storease_mobileapp_dev/screen/notification/notification.dart';
import 'package:storease_mobileapp_dev/screen/package/packageDetail.dart';

import '../../method/send_whatsapp_message.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  late String idUser; // State variable for user ID
  String phoneNumber = "+6285895929918";

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserId(); // Fetch user ID on initialization
    _loadPackage();
  }
  void safeSetState(VoidCallback fn) {
    if (mounted) {
      setState(fn);
    }
  }
  Future<void> _loadUserId() async {
    String userId =
        await SecureStorage().readSecureData(dotenv.env["KEY_USER_ID"]!);
    safeSetState(() {
      idUser = userId; // Set user ID once retrieved
    });
  }

  // List<String> categoryList = ["beauty", "fragrances", "furniture"];
  late PackageResponseModel responseModel;
  List<PackageCategoryModel> categoryList = [];
  List<ImageWithPackageID> imageBanner = [];
  Future<void> _loadPackage() async {
    ApiServices apiServices = ApiServices();
    List<ImageWithPackageID> imageBannerData = [];
    try {
      apiServices.getPackagesAll().then((value) {
        for (var category in value.packageCategory) {
          for (var package in category.packages) {
            imageBannerData.add(ImageWithPackageID(
                imageUrl: package.image_url[0], packageID: package.id));
          }
        }
        safeSetState(() {
          imageBanner = imageBannerData;
          categoryList = value.packageCategory;
          isLoading = false;
        });
      });
    } catch (e) {
      print("Error loading packages: $e");
      safeSetState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // bool isLoading = package1 == null || package2 == null || package3 == null;

    List<Widget> categoryListContentBuilder(
        List<PackageCategoryModel> listPackageCategory) {
      return listPackageCategory.map((category) {
        return MyContentHomepagePackage(
          packageCategory: category.id,
          packages: category.packages,
          title: category.name,
          loading: isLoading,
        );
      }).toList();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                width: 40,
                height: 40,
                child: Image.asset(
                  "images/logo_white.png",
                  fit: BoxFit.contain,
                )),
            Expanded(
              child: Text(
                textAlign: TextAlign.center,
                "STOREASE",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (idUser != null) {
                sendWhatsAppMessage(idUser, phoneNumber);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("User ID not loaded yet")),
                );
              }
            },
            icon: Icon(Icons.chat_bubble_outline),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return NotificationPage();
              }));
            },
            icon: Icon(Icons.notifications_outlined),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 10),
                SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: isLoading
                      ? ShimmerSkeleton()
                      : AnotherCarousel(
                          images: imageBanner.map((imageData) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return PackageDetail(
                                      productID: imageData.packageID);
                                }));
                                // Navigator.push()
                                // _goToDetailPage(imageData.packageID);
                              },
                              child: Image.network(imageData.imageUrl,
                                  fit: BoxFit.cover),
                            );
                          }).toList(),
                          dotSize: 6,
                          indicatorBgPadding: 5.0,
                        ),
                ),
                SizedBox(height: 10),
                isLoading
                    ? Container(
                        width: double.infinity,
                        child: ShimmerSkeleton(),
                      )
                    : Divider(
                        indent: 5,
                        endIndent: 5,
                        thickness: 2,
                        color: MyColor.color1,
                      ),
                // isLoading ? MyContentHomepagePackageLoading()*3 :
                ...(isLoading
                    ? List.generate(3, (_) => MyContentHomepagePackageLoading())
                    : categoryListContentBuilder(categoryList)),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImageWithPackageID {
  final String imageUrl;
  final int packageID;
  ImageWithPackageID({required this.imageUrl, required this.packageID});
}
