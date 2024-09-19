import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/screen/components/my_order_cust_table.dart';
import 'package:storease_mobileapp_dev/screen/order/order.dart';
import 'package:storease_mobileapp_dev/screen/vr/vrDisplay.dart';

class PackageCheckout extends StatefulWidget {
  const PackageCheckout({super.key});

  @override
  State<PackageCheckout> createState() => _PackageCheckoutState();
}

class _PackageCheckoutState extends State<PackageCheckout> {
  DateTime _dateTime = DateTime.now();

  void _selectDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(DateTime.now().year + 5))
        .then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: 160, // Adjust the width based on the text length
        height: 50, // Adjust the height if necessary
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return Order();
            }));
          },
          icon: Icon(Icons.receipt_long, size: 18), // Use the desired icon
          label: Text("Buat Pesanan"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, // Set background color
            foregroundColor: Colors.blue, // Set text and icon color
            side: BorderSide(
                color: Colors.blue), // Border color matching the style
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // Rounded shape
            ),
            padding: EdgeInsets.symmetric(
                horizontal: 16), // Padding inside the button
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Text(
                    "Pilih Tanggal Pernikahan",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _selectDate();
                      },
                      child: Text("${_dateTime.toLocal()}")),
                ],
              ),
            ),
            MyOrderCustTable(),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.grey.shade300),
              child: Column(
                children: [
                  Container(
                    child: Text("Package by The Amaryllis boutiqew Resort"),
                  ),
                  Container(
                    color: Colors.amber,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 175,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(4, (index) {
                                return Container(
                                  margin: EdgeInsets.all(2),
                                  height: double.infinity,
                                  child: Image.asset("images/venue_image.png",
                                      fit: BoxFit.cover),
                                );
                              }),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text("Detail"),
                        Text(
                            "Ini adalah detail dari produk yang berisi deskripsi mendalam. \n Ini adalah list 1\nlist 2\nini adalah deskripsi yang bisa diberikan oleh Package")
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        const Text(
                          "Preview",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return VRDisplay();
                            }));
                          },
                          child: Image.asset("images/icon_virtual_reality.png"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          "Rincian Pembayaran",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            "* Down Payment: 40%\n*Pembayaran Kedua: 40%\nPembayaran Terakhir: 20%"),
                      ],
                    ),
                  )
                ],
              ),
            ),
            
            SizedBox(
              height: 100,
            )
          ],
        ),
      )),
    );
  }
}
