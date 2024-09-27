import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/screen/components/my_package_list_item.dart';
import 'package:storease_mobileapp_dev/screen/package/packageDetail.dart';

class ListPackage extends StatefulWidget {
  final String title_list;
  const ListPackage({required this.title_list, super.key});

  @override
  State<ListPackage> createState() => _ListPackageState();
}

class _ListPackageState extends State<ListPackage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title_list), // Use widget.title_list to access the passed title
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          children: [
            // Wrap PackageListItem in Container to add margin
            Container(
              margin: const EdgeInsets.only(bottom: 10), // Margin after the item
              child: MyPackageListItem(),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10), // Margin after the item
              child: MyPackageListItem(),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10), // Margin after the item
              child: MyPackageListItem(),
            ),
          ],
        ),
      ),
    );
  }
}
