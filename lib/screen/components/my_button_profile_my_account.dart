import 'package:flutter/material.dart';
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
      height: 45,
      child: loading? ShimmerSkeleton() : ElevatedButton(
          onPressed: onPressed,
          child: Row(
            children: [
              icon,
              SizedBox(width: 10,),
              Expanded(child: Text(title)),
              Icon(Icons.arrow_forward_ios)
            ],
          )),
    );
  }
}
