
import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/screen/package/packageDetail.dart';

class MyPackageListItem extends StatelessWidget {
  const MyPackageListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PackageDetail();
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
              color: Colors.amber,
              width: double.infinity,
              constraints: const BoxConstraints(maxHeight: 180),
              child: Image.asset(
                "images/venue_image.png",
                fit: BoxFit.cover,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // First widget with flex 1
                Flexible(
                  flex: 1,
                  child: Container(
                    child: Text("Paket A"),
                  ),
                ),
                // Second widget with flex 3
                Flexible(
                  flex: 3,
                  child: Container(
                    child: Text("Judul Paket"),
                  ),
                ),
                // Third widget with flex 1
                Flexible(
                  flex: 1,
                  child: Container(
                    child: Text("Harga"),
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
