import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/screen/components/my_order_cust_table.dart';
import 'package:storease_mobileapp_dev/screen/order/orderPDFview.dart';
import 'package:storease_mobileapp_dev/screen/payment/payment.dart';
import 'package:storease_mobileapp_dev/screen/vr/vrDisplay.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;
// import 'package:url_launcher/url_launcher.dart';

class Orderdetail extends StatefulWidget {
  const Orderdetail({super.key});

  @override
  State<Orderdetail> createState() => _OrderdetailState();
}

class _OrderdetailState extends State<Orderdetail> {
  // final Uri laporanRapatPerdanaURI = Uri.parse(
  //     "https://unej.ac.id/wp-content/uploads/2022/06/Buku-Akademik-UNEJ-14-Oktober-2021-1.pdf");
  final String laporanRapatPerdanaURL =
      "https://unej.ac.id/wp-content/uploads/2022/06/Buku-Akademik-UNEJ-14-Oktober-2021-1.pdf";
  final String id_user = "ini id user";
  final String id_pesanan = "ini id pesanan";

void sendWhatsAppMessage(String phoneNumber, String message) async {
  final Uri whatsappUri = Uri.parse("https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}");
  
  if (await canLaunchUrl(whatsappUri)) {
    await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $whatsappUri';
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Detail Pesanan"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: 160, // Adjust the width based on the text length
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Payment();
                }));
              },
              icon: Icon(Icons.payment, size: 18), // Use the desired icon
              label: Text("Bayar"),
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
            ElevatedButton.icon(
              onPressed: () {
                sendWhatsAppMessage("+6285895929918", "hallo ");
              },
              icon: Icon(Icons.message, size: 18), // Use the desired icon
              label: Text("Chat Admin"),
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
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: MyColor.colorSecondary,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "MENUNGGU JADWAL RAPAT PERTAMA",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MyOrderCustTable(),
              SizedBox(
                height: 20,
              ),
              ExpansionTile(
                collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                iconColor: MyColor.colorSecondary,
                collapsedIconColor: MyColor.colorMain,
                collapsedBackgroundColor: MyColor.color1,
                backgroundColor: MyColor.colorMain,
                title: Text("Package by The Amaryllis Boutiqe Resort"),
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(color: Colors.grey.shade300),
                    child: Column(
                      children: [
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
                                        child: Image.asset(
                                            "images/venue_image.png",
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
                                child: Image.asset(
                                    "images/icon_virtual_reality.png"),
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
                ],
              ),
              // ElevatedButton(onPressed: () async {
              //   if (await canLaunchUrl(laporanRapatPerdanaURL)){
              //     await launchUrl(laporanRapatPerdanaURL);
              //   } else {
              //     print("Cannot display the PDF");
              //   }
              // }, child: Text("Lihat PDF")),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10)),
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            constraints: BoxConstraints(maxWidth: 190),
                            child: Text(
                              "Notulensi Rapat Perdana",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Diperbaharui pada",
                              style: TextStyle(fontSize: 11),
                            ),
                            Text(
                              "Rabu, 1 Januari 2024, 10.00",
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return OrderPDFView(url: laporanRapatPerdanaURL);
                            }));
                          },
                          child: Text("Lihat PDF")),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 75,
              )
            ],
          ),
        ),
      ),
    );
  }
}
