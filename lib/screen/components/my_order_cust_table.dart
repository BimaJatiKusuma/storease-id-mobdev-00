import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/model/profileResponseModel.dart';
import 'package:storease_mobileapp_dev/screen/components/shimmer_skeleton.dart';

class MyOrderCustTable extends StatelessWidget {
  final ProfileResponseModel? profile;
  final bool isLoading;

  const MyOrderCustTable({super.key, required this.profile, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: MyColor.colorSecondary,
      ),
      child: isLoading || profile == null
          ? ShimmerSkeleton()
          : Table(
              columnWidths: {
                0: IntrinsicColumnWidth(),
                1: IntrinsicColumnWidth(),
                2: IntrinsicColumnWidth(flex: 1),
              },
              children: [
                TableRow(children: [
                  Text("Nama"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(":"),
                  ),
                  Text(profile!.name) // Use '!' to ensure non-null
                ]),
                TableRow(children: [
                  Text("No. Telepon"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(":"),
                  ),
                  Text(profile!.phone)
                ]),
                TableRow(children: [
                  Text("Alamat"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(":"),
                  ),
                  Text("Alamat ini")
                ]),
              ],
            ),
    );
  }
}
