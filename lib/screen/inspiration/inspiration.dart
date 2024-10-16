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
  List<ImageWithPackageID> allImage = [];

  @override
  void initState() {
    super.initState();
    _loadPackages();
  }
  void safeSetState(VoidCallback fn) {
    if (mounted) {
      setState(fn);
    }
  }

  Future<void> _loadPackages() async {
    ApiServices apiServices = ApiServices();
    try {
      PackageResponseModel allPackages = await apiServices.getPackagesAll();
      List<ImageWithPackageID> images = [];
      for (var category in allPackages.packageCategory) {
        for (var package in category.packages) {
          for (var imageUrl in package.image_url) {
            images.add(
                ImageWithPackageID(imageUrl: imageUrl, packageID: package.id));
          }
        }
      }
      safeSetState(() {
        allImage = images;
        packages = allPackages;
        _isLoading = false;
      });
    } catch (e) {
      print("Error loading packages: $e");
      safeSetState(() {
        _isLoading = false;
      });
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
              ? _buildLoadingGrid()
              : allImage.isEmpty
                  ? Center(child: Text("Tidak ada gambar tersedia"))
                  : _buildImageGrid()),
    );
  }

  Widget _buildLoadingGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: StaggeredGrid.count(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          children: List.generate(
            6, // Number of placeholders you want to show during loading
            (index) => ShimmerSkeleton(width: double.infinity, height: 250),
          ),
        ),
      ),
    );
  }

  Widget _buildImageGrid() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        itemCount: allImage.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 1, // Adjust as needed
        ),
        itemBuilder: (context, index) {
          final imageWithId = allImage[index];
          return _buildImageItem(imageWithId);
        },
      ),
    );
  }

  Widget _buildImageItem(ImageWithPackageID imageWithId) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          // Navigate to PackageDetail with the package ID
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PackageDetail(
                productID: imageWithId.packageID,
              ),
            ),
          );
        },
        child: CachedNetworkImage(
          imageUrl: imageWithId.imageUrl,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              color: Colors.white,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
          fit: BoxFit.cover,
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