import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/model/packageResponseModel.dart';

class MyContentHomepagePackageItem extends StatelessWidget {
  final VoidCallback? onTap;
  final PackageModel package;

  const MyContentHomepagePackageItem({
    Key? key,
    required this.onTap,
    required this.package,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Ink(
        padding: const EdgeInsets.all(10),
        // margin: const EdgeInsets.only(right: 10),
        width: 170,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,        
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 5),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          splashColor: Colors.grey.withOpacity(0.3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child:
                Image.network(package.thumbnail_url,
                  height: 100, width: double.infinity, fit: BoxFit.cover,
                )
                // Image.asset(
                //   "images/package_image.png",
                //   height: 100,
                //   width: double.infinity,
                //   fit: BoxFit.cover,
                // ),
              ),
              const SizedBox(height: 8),
              Text(
                package.title ?? "Elegant Affair Package | Outdoor Wedding",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                "by Storease Wedding Organizer",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 11,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Rp. 11.000.000",
                style: const TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
