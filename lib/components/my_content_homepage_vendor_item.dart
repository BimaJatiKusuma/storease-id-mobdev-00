import 'package:flutter/material.dart';

class MyContentHomepageVendorItem extends StatelessWidget {
  final Function()? onTap;
  const MyContentHomepageVendorItem({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        width: 150,
        height: 150,
        color: Colors.blueGrey,
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "images/vendor_image.png",
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    child: Text("Bali"),
                    color: Colors.amber,
                  )
                ],
              ),
            ),
            Text(
              "[INI JUDUL DARI VENDOR DAN INI ADALAH TEST JUDUL PANJANG]", maxLines: 2,
            ),
            Row(
              children: [
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star_half),
              ],
            )
          ],
        ),
      ),
    );
  }
}
