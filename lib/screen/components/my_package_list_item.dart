
import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/model/packageResponseModel.dart';
import 'package:storease_mobileapp_dev/screen/package/packageDetail.dart';

class MyPackageListItem extends StatelessWidget {
  final PackageModel package;
  
  MyPackageListItem({
    required this.package,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PackageDetail(productID: package.id,);
        }));
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              // color: Colors.amber,
              width: double.infinity,
              constraints: const BoxConstraints(maxHeight: 180),
              child: Image.network(package.thumbnail_url,fit: BoxFit.contain,)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // First widget with flex 1
                Flexible(
                  flex: 1,
                  child: Container(
                    child: Text(package.category),
                  ),
                ),
                // Second widget with flex 3
                Flexible(
                  flex: 3,
                  child: Container(
                    child: Text(package.title),
                  ),
                ),
                // Third widget with flex 1
                Flexible(
                  flex: 1,
                  child: Container(
                    child: Text(package.price),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
