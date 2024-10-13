import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/model/packageResponseModel.dart';
import 'package:storease_mobileapp_dev/screen/components/my_content_homepage_package_item.dart';
import 'package:storease_mobileapp_dev/screen/components/shimmer_skeleton.dart';
import 'package:storease_mobileapp_dev/screen/homepage/list_package.dart';
import 'package:storease_mobileapp_dev/screen/package/packageDetail.dart';

class MyContentHomepagePackage extends StatelessWidget {
  final String title;
  final List<PackageModel>? packages;
  final bool loading;

  const MyContentHomepagePackage({
    required this.packages,
    required this.title,
    required this.loading, // Add loading as a parameter
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                if (!loading)
                  RichText(
                    text: TextSpan(
                      text: "Lihat Semua",
                      style: TextStyle(
                        color: MyColor.color1,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ListPackage(titleList: title);
                          }));
                        },
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            constraints: BoxConstraints(maxHeight: 250),
            child: loading
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5, // Show 5 shimmer items while loading
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: ShimmerSkeleton(width: 150, height: 150),
                      );
                    },
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (packages!.length > 4) ? 5 : packages!.length,
                    itemBuilder: (context, index) {
                      if (index < 4) {
                        final package = packages![index];

                        return MyContentHomepagePackageItem(
                          package: package,
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return PackageDetail(productID: package.id);
                            }));
                          },
                        );
                      } else {
                        // The "Lihat Semua" button as the 5th item
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ListPackage(titleList: title);
                            }));
                          },
                          child: Center(
                            // Center the button vertically within its parent
                            child: SizedBox(
                              // width: 150, // Button width
                              // height: 50, // Button height
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors
                                      .white, // iOS-like white button background
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        30), // Make button rounded
                                  ),
                                  elevation:
                                      4, // Elevation to make it "pop" like an iOS button
                                ),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return ListPackage(titleList: title);
                                  }));
                                },
                                child: Icon(Icons.arrow_forward_ios, size: 40,)
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
