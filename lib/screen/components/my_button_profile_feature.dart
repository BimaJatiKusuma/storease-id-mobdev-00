import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class MyButtonProfileFeature extends StatelessWidget {
    final Function()? onTap;
    final String label_name;
    // final IconData? icon;
    final String asset;
    const MyButtonProfileFeature({
        super.key,
        // this.icon,
        required this.asset,
        required this.label_name,
        required this.onTap
    });

    @override
    Widget build(BuildContext context){
        return GestureDetector(
          onTap: onTap,
          child: Container(
            width: 60,
            child: Column(
              children: [
                Container(height: 30, width: 30,child: SvgPicture.asset(asset)),
                SizedBox(height: 5,),
                // Image.asset(asset),
                Expanded(child: Text(label_name, textAlign: TextAlign.center, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),))
              ],
            ),
          ),
        );
    }
}