import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/model/orderResponseModel.dart';
import 'package:storease_mobileapp_dev/screen/order/order.dart';
import 'package:storease_mobileapp_dev/screen/order/wedding_essentials.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  final List<OrderResponseModel> orders = [
    OrderResponseModel(id: 1, package_id: 1, status: 2),
    OrderResponseModel(id: 2, package_id: 2, status: 3),
    OrderResponseModel(id: 3, package_id: 3, status: 4),
    OrderResponseModel(id: 4, package_id: 4, status: 5),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Detail"),
      ),
      body: SafeArea(child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: orders.length,
        itemBuilder: (context, index){
          return OrderListContent(orderData: orders[index]);
      })),
    );
  }
}


class OrderListContent extends StatelessWidget {
  final OrderResponseModel orderData;
  const OrderListContent({super.key, required this.orderData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return WeddingEssentials(orderData: orderData,);
        }));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Vendor | Category",
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  width: 10,
                ),
                // Ensure that the Column expands within the Row
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align the text to the start
                    children: [
                      // Text will wrap to the next line if it exceeds the available width
                      Text(
                        textAlign: TextAlign.end,
                        "Harap Melakukan Pembayaran Awal",
                        style: TextStyle(fontSize: 12),
                        softWrap: true, // Enables text to wrap
                        overflow: TextOverflow
                            .visible, // Ensure overflow handling is visible
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: MyColor.colorSecondary,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                      width: 150,
                      child: Image.asset(
                        "images/venue_image.png",
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("The Grand Karunia Function Hall - Bogor",
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold)),
                        Text("ID Pesanan : xxx-xxx-xxx",
                            style: TextStyle(fontSize: 12)),
                        Text("Total harga : Rp. 10.000.000",
                            style: TextStyle(fontSize: 12)),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return WeddingEssentials(orderData: orderData,);
                                    }));
                                  },
                                  child: Text("Detail"))
                            ])
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
