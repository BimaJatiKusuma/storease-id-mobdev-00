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
        centerTitle: true,
        title: Text("PESANAN SAYA"),
      ),
      body: SafeArea(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: orders.length,
              itemBuilder: (context, index) {
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
    return Container(
      // decoration: BoxDecoration(color: Colors.amber),
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return WeddingEssentials(
              orderData: orderData,
            );
          }));
        },
        child: Container(
          // padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: MyColor.colorMain.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: const Offset(0, 5),
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          width: double.infinity,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: MyColor.colorMain,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "status ${orderData.status}/7",
                      style: TextStyle(
                          color: MyColor.textWhite,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    // Ensure that the Column expands within the Row
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .end, // Align the text to the start
                        children: [
                          // Text will wrap to the next line if it exceeds the available width
                          Text(
                            textAlign: TextAlign.end,
                            "Harap Melakukan Pembayaran Awal",
                            style: TextStyle(
                                color: MyColor.textWhite,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                            softWrap: true, // Enables text to wrap
                            overflow: TextOverflow
                                .visible, // Ensure overflow handling is visible
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // Divider(),
              Container(
                  height: 150,
                  child: Image.asset(
                    "images/venue_image.png",
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
              
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text("The Grand Karunia Function Hall - Bogor",
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold)),
                    ),
                    Text("ID Pesanan : xxx-xxx-xxx",
                        style: TextStyle(fontSize: 12)),
                    Text("Tanggal Pernikahan : 24 Oktober 2024",
                        style: TextStyle(fontSize: 12)),
                    Text("Total harga : Rp. 10.000.000",
                        style: TextStyle(fontSize: 12)),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return WeddingEssentials(
                                orderData: orderData,
                              );
                            }));
                          },
                          child: Text("KELENGKAPAN PERNIKAHAN"))
                    ])
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
