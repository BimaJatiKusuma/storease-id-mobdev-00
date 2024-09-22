import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/color/color.dart';

class MyOrderCustTable extends StatelessWidget {
  const MyOrderCustTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: MyColor.colorSecondary
      ),
      child: Table(
        columnWidths: {
          0: IntrinsicColumnWidth(),
          1: IntrinsicColumnWidth(),
          2: IntrinsicColumnWidth(flex: 1),
        },
        children: [
          TableRow(children: [
            Text("Nama"),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0), // Add padding to the 2nd column
              child: Text(":"),
            ),
            Text("Alex")
          ]),
          TableRow(children: [
            Text("No. Telepon"),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0),
              child: Text(":"),
            ),
            Text("(+62) 867-673-213")
          ]),
          TableRow(children: [
            Text("Alamat"),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0),
              child: Text(":"),
            ),
            Text(
                "Jln. Sumber  sari No. 54, Sumbersari, Jember, Jawa Timur")
          ]),
          TableRow(children: [
            Text("ID Pesanan"),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0),
              child: Text(":"),
            ),
            Text("xxx-xxx-xxx")
          ]),
        ],
      ),
    );}
}