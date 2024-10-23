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
            borderRadius: BorderRadius.all(Radius.circular(15)), // Rounded corners
          ),
          width: double.infinity,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: MyColor.colorMain,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15))),
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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            textAlign: TextAlign.end,
                            "Harap Melakukan Pembayaran Awal",
                            style: TextStyle(
                                color: MyColor.textWhite,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
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
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text("The Grand Karunia Function Hall - Bogor",
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 5),
                    Text("ID Pesanan : xxx-xxx-xxx",
                        style: TextStyle(fontSize: 12)),
                    Text("Tanggal Pernikahan : 24 Oktober 2024",
                        style: TextStyle(fontSize: 12)),
                    Text("Total harga : Rp. 10.000.000",
                        style: TextStyle(fontSize: 12)),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Container(
                        decoration: BoxDecoration(
                          color: MyColor.colorMain,
                          borderRadius: BorderRadius.circular(30),
                          // gradient: LinearGradient(
                          //   colors: [Colors.purple, Colors.blue],
                          //   begin: Alignment.topLeft,
                          //   end: Alignment.bottomRight,
                          // ),
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return WeddingEssentials(
                                orderData: orderData,
                              );
                            }));
                          },
                          child: Text(
                            "KELENGKAPAN PERNIKAHAN",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
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
