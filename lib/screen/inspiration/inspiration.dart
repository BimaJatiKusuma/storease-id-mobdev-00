import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:storease_mobileapp_dev/api/api_services.dart';
import 'package:storease_mobileapp_dev/model/packageResponseModel.dart';
import 'package:storease_mobileapp_dev/screen/components/shimmer_skeleton.dart';
import 'package:storease_mobileapp_dev/screen/package/packageDetail.dart';

class Inspiration extends StatefulWidget {
  Inspiration({super.key});

  @override
  State<StatefulWidget> createState() => _InspirationState();
}

class _InspirationState extends State<Inspiration> {
  bool _isLoading = true;
  late PackageResponseModel packages;

  @override
  void initState() {
    super.initState();
    _loadPackages();
  }

  Future<void> _loadPackages() async {
    ApiServices apiServices = ApiServices();
    try {
      PackageResponseModel allPackages = await apiServices.getPackagesAll();
      setState(() {
        packages = allPackages;
        _isLoading = false;
      });
    } catch (e) {
      print("Error loading packages: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("INSPIRASI"),
          automaticallyImplyLeading: false,
        ),
        body: _isLoading
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  child: StaggeredGrid.count(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: List.generate(
                      6, // Number of placeholders you want to show during loading
                      (index) =>
                          ShimmerSkeleton(width: double.infinity, height: 250),
                    ),
                  ),
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  child: StaggeredGrid.count(
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    crossAxisCount: 2,
                    children: packages.package.map((package) {
                      return Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return PackageDetail(
                                productID: package.id,
                              ); // Pass any data if needed
                            }));
                          },
                          child: CachedNetworkImage(
                            imageUrl: package.thumbnail_url,
                            placeholder: (context, url) =>
                                ShimmerSkeleton(width: 50, height: 250),
                            errorWidget: (context, url, error) {
                              print('Error loading image: $url');
                              return Icon(Icons.error);
                            },
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
      ),
    );
  }
}
