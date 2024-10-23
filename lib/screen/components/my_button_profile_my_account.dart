import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/screen/components/shimmer_skeleton.dart';

class MyButtonProfileMyAccount extends StatelessWidget {
  final String title;
  final Icon icon;
  final Function()? onPressed;
  final bool loading;

  const MyButtonProfileMyAccount({
    required this.icon,
    required this.loading,
    required this.onPressed,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45, // Increased height for a more luxurious feel
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), // Soft rounded corners
        gradient: loading ? null : LinearGradient( // Fancy gradient background
          colors: [
            MyColor.color1,
            MyColor.canvaMainColor, 
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4), // Subtle shadow for depth
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: loading
          ? ShimmerSkeleton()
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20), // Extra padding for comfort
                backgroundColor: Colors.transparent, // Let the gradient show
                shadowColor: Colors.transparent, // Remove button default shadow
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded edges for the button
                ),
              ),
              onPressed: onPressed,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      icon,
                      SizedBox(width: 12), // Spaced out icon and text
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white, // White text for better contrast
                          fontSize: 16, // Larger font for elegance
                          fontWeight: FontWeight.w500, // Bold to make the text stand out
                          letterSpacing: 1.2, // Slight spacing for a sleek look
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white.withOpacity(0.8), // Softer color for icon
                    size: 20,
                  ),
                ],
              ),
            ),
    );
  }
}
