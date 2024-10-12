import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/screen/components/shimmer_skeleton.dart';

class MyButtonProfileConfigure extends StatelessWidget {
  final Function()? onTap;
  final String label_name;
  final Color textColor;
  final Color colorBorder;
  final bool loading;

  const MyButtonProfileConfigure({
    super.key,
    required this.colorBorder,
    required this.loading,
    required this.onTap,
    required this.label_name,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      height: 40,
      child: loading
          ? ShimmerSkeleton()
          : InkWell(
              onTap: () {
                if (onTap != null) {
                  onTap!(); // Call the onTap function when tapped
                }
              },
              borderRadius: BorderRadius.circular(10), // InkWell splash will follow rounded corners
              splashColor:
                  colorBorder.withOpacity(0.3), // Customize splash color
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: colorBorder),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  label_name,
                  style: TextStyle(color: textColor),
                ),
              ),
            ),
    );
  }
}
