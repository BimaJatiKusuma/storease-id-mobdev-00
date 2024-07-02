import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:storease_mobileapp_dev/screen/components/my_content_vendor_tile.dart';

class VendorCategory extends StatefulWidget {
  final String appBarName;
  const VendorCategory({super.key, required this.appBarName}); //recomendation from vscode

  @override
  State<StatefulWidget> createState() {
    return _vendorCategoryState();
  }
}

class _vendorCategoryState extends State<VendorCategory> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(widget.appBarName),
            ),
            body: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ElevatedButton(
                                onPressed: () {}, child: Text("Bogor")),
                            ElevatedButton(
                                onPressed: () {}, child: Text("Popular")),
                            ElevatedButton(
                                onPressed: () {},
                                child: Text("5.000.000 - 10.000.000")),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          MyContentVendorTile(),
                          MyContentVendorTile(),
                          MyContentVendorTile(),
                          MyContentVendorTile(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
