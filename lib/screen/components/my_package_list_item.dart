import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
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
    final currencyFormatter = NumberFormat.currency(
      locale: 'id_ID', // Indonesian locale
      symbol: 'Rp. ', // Currency symbol
      decimalDigits: 0, // No decimal places
    );
    double value = double.parse(package.price);
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PackageDetail(
            productID: package.id,
          );
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 5),
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
            Stack(
              children: [
                Container(
                    // color: Colors.amber,
                    width: double.infinity,
                    constraints: const BoxConstraints(maxHeight: 180),
                    child: Image.network(
                      package.thumbnail_url,
                      fit: BoxFit.contain,
                    )),
                Positioned(
                  bottom: 0,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.5),
                    ),
                    child: Text(currencyFormatter.format(value),
                        style: const TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: const Color.fromARGB(255, 199, 218, 255)
                      .withOpacity(0.4)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: Container(
                      child: Text(
                        package.title,
                        style: TextStyle(fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow
                            .ellipsis, // Adds "..." if text is too long
                        maxLines:
                            2, // Text will move to a second line if needed
                        softWrap: true, // Allows text to wrap to the next line
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
