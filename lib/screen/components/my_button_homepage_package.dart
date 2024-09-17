import 'package:flutter/material.dart';

class MyButtonHomepagePackage extends StatelessWidget {
  // final Function()? onTap;
  final String label_name;
  final IconData icon;
  const MyButtonHomepagePackage({
    super.key,
    required this.icon,
    required this.label_name,
    // required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SnackBar(
            content: Text(
          "You Have Been Press the button 9my_button_homepage_package",
        ));
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return PackageCategory(
        //     appBarName: label_name,
        //   );
        // }));
      },
      child: Container(
        margin: EdgeInsets.only(right: 20),
        child: Column(
          children: [
            Icon(icon),
            Text(
              label_name,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
