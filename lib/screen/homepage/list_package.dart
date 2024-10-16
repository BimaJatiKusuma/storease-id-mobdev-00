import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/api/api_services.dart';
import 'package:storease_mobileapp_dev/model/packageResponseModel.dart';
import 'package:storease_mobileapp_dev/screen/components/my_package_list_item.dart';
import 'package:storease_mobileapp_dev/screen/components/shimmer_skeleton.dart';

class ListPackage extends StatefulWidget {
  final int idCategory;
  // final PackageCategoryModel packageByCategory;
  const ListPackage({required this.idCategory,
  // required this.packageByCategory,
  Key? key}) : super(key: key);

  @override
  State<ListPackage> createState() => _ListPackageState();
}

class _ListPackageState extends State<ListPackage> {
  // late PackageResponseModel pack
  // ages;
  late List<PackageCategoryModel> categoryList;
  late List<PackageModel> packageList;
  bool _isLoading = true;
  String? _errorMessage;
  late PackageCategoryModel currentCategory;

  @override
  void initState() {
    super.initState();
    _loadPackageByCategory(widget.idCategory);
  }

  Future<void> _loadPackageByCategory(int idCategory) async {
    ApiServices apiServices = ApiServices();
    try {
      PackageResponseModel packagesResponse =
          await apiServices.getPackagesAll();
      setState(() {
        // packages = packagesResponse;
        categoryList = packagesResponse.packageCategory;
        currentCategory = categoryList[idCategory];
        packageList = currentCategory.packages;
        _isLoading = false;
      });
    } catch (e) {
      // Handle exceptions appropriately
      print("Error loading packages: $e");
      setState(() {
        _isLoading = false;
        _errorMessage = "Failed to load packages. Please try again.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isLoading ? ShimmerSkeleton() : Text(currentCategory.name),
      ),
      body: _isLoading
          ? ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          width: double.infinity,
                          height: 150,
                          margin: const EdgeInsets.only(bottom: 10),
                          child: ShimmerSkeleton(),
                        );
                      },
                    )
          : _errorMessage != null
              ? Center(
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                )
              : packageList.isEmpty
                  ? const Center(
                      child: Text(
                        "No packages available.",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: packageList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: MyPackageListItem(package: packageList[index]),
                        );
                      },
                    ),
    );
  }
}
