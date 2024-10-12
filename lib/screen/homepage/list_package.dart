import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/api/api_services.dart';
import 'package:storease_mobileapp_dev/model/packageResponseModel.dart';
import 'package:storease_mobileapp_dev/screen/components/my_package_list_item.dart';

class ListPackage extends StatefulWidget {
  final String titleList;
  const ListPackage({required this.titleList, super.key});

  @override
  State<ListPackage> createState() => _ListPackageState();
}

class _ListPackageState extends State<ListPackage> {
  late PackageResponseModel packages;
  late List<PackageModel> package;
  bool _isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadPackageByCategory();
  }

    Future<void> _loadPackageByCategory() async {
    ApiServices apiServices = ApiServices();
    try {
      PackageResponseModel packagesResponse =
          await apiServices.getPackagByCategory(widget.titleList);
      setState(() {
        packages = packagesResponse;
        package = packages.package;
        _isLoading = false;
      });
    } catch (e) {
      // Handle exceptions appropriately
      print("Error loading packages: $e");
        _isLoading = false;
      // Optionally, set state to indicate an error occurred
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titleList), // Use widget.title_list to access the passed title
      ),
      body: Center(
        child: _isLoading ? CircularProgressIndicator() : SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            children: [
              // Wrap PackageListItem in Container to add margin
              Container(
                margin: const EdgeInsets.only(bottom: 10), // Margin after the item
                child: MyPackageListItem(package: package[0],),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10), // Margin after the item
                child: MyPackageListItem(package: package[1],),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10), // Margin after the item
                child: MyPackageListItem(package: package[2],),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
