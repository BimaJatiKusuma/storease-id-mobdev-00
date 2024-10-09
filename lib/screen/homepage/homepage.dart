import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:storease_mobileapp_dev/api/api_services.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/method/secure_storage.dart';
import 'package:storease_mobileapp_dev/model/packageResponseModel.dart';
import 'package:storease_mobileapp_dev/screen/ai/ai.dart';
import 'package:storease_mobileapp_dev/screen/components/my_content_homepage_package.dart';
import 'package:storease_mobileapp_dev/screen/notification/notification.dart';

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

  @override
  void initState() {
    super.initState();
    _loadUserId(); // Fetch user ID on initialization
    _loadPackageByCategory();
    // _loadPackageByCategory("beauty");
    // _loadPackageByCategory("fragrances");
    // _loadPackageByCategory("furniture");
  }

  Future<void> _loadUserId() async {
    String userId =
        await SecureStorage().readSecureData(dotenv.env["KEY_USER_ID"]!);
    setState(() {
      idUser = userId; // Set user ID once retrieved
    });
  }

  List<PackageModel>? package1;
  List<PackageModel>? package2;
  List<PackageModel>? package3;
  Future<void> _loadPackageByCategory() async {
    ApiServices apiServices = ApiServices();

    try {
      PackageResponseModel beautyPackages =
          await apiServices.getPackagByCategory("beauty");
      PackageResponseModel fragrancesPackages =
          await apiServices.getPackagByCategory("fragrances");
      PackageResponseModel furniturePackages =
          await apiServices.getPackagByCategory("furniture");

      setState(() {
        package1 = beautyPackages.package;
        // package2 = beautyPackages.package;
        // package3 = beautyPackages.package;
        package2 = fragrancesPackages.package;
        package3 = furniturePackages.package;
      });
    } catch (e) {
      // Handle exceptions appropriately
      print("Error loading packages: $e");
      // Optionally, set state to indicate an error occurred
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("images/logo_white.png"),
        title: Text(
          "STOREASE",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (idUser != null) {
                sendWhatsAppMessage(idUser, phoneNumber);
              } else {
                // Handle the case where idUser is not yet loaded
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
                return AIPage();
              }));
            },
            icon: Image.asset("images/Ai.png"),
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
                SizedBox(height: 10),
                SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: AnotherCarousel(
                    images: [
                      AssetImage("images/banner.png"),
                      AssetImage("images/banner.png"),
                      AssetImage("images/banner.png"),
                    ],
                    dotSize: 6,
                    indicatorBgPadding: 5.0,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Divider(
                    color: MyColor.color1,
                  ),
                ),
                // Check if packages are loaded
                if (package1 != null &&
                    package2 != null &&
                    package3 != null) ...[
                  MyContentHomepagePackage(
                      title: "Paket Tipe A", packages: package1!),
                  SizedBox(height: 20),
                  MyContentHomepagePackage(
                      title: "Paket Tipe B", packages: package2!),
                  SizedBox(height: 20),
                  MyContentHomepagePackage(
                      title: "Paket Tipe C", packages: package3!),
                  SizedBox(height: 20),
                ] else ...[
                  // Show a loading indicator while packages are being fetched
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CircularProgressIndicator(),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
