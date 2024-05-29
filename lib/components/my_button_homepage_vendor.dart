import 'package:flutter/material.dart';

class MyButtonHomepageVendor extends StatelessWidget {
    final Function()? onTap;
    final String label_name;
    final IconData icon;
    const MyButtonHomepageVendor({
        super.key,
        required this.icon,
        required this.label_name,
        required this.onTap
    });

    @override
    Widget build(BuildContext context){
        return GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.only(right: 20),
            child: Column(
              children: [
                Icon(icon),
                Text(label_name)
              ],
            ),
          ),
        );
    }
}