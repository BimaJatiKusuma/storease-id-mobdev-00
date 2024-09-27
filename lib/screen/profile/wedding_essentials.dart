import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/method/send_whatsapp_message.dart';
import 'package:storease_mobileapp_dev/screen/components/my_order_cust_table.dart';
import 'package:storease_mobileapp_dev/screen/order/orderDetail.dart';
import 'package:storease_mobileapp_dev/screen/order/orderPDFview.dart';
import 'package:storease_mobileapp_dev/screen/profile/wedding_essentials_detail.dart';

class WeddingEssentials extends StatefulWidget {
  const WeddingEssentials({super.key});

  @override
  State<WeddingEssentials> createState() => _WeddingEssentialsState();
}

class _WeddingEssentialsState extends State<WeddingEssentials> {
  String pdfURL =
      "https://unej.ac.id/wp-content/uploads/2023/10/Akreditasi-Universitas-Jember.pdf";
  final String laporanRapatPerdanaURL =
      "https://unej.ac.id/wp-content/uploads/2022/06/Buku-Akademik-UNEJ-14-Oktober-2021-1.pdf";
  final String id_user = "ini id user";
  final String id_pesanan = "ini id pesanan";
  final String phone_number = "+6285895929918";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kelengkapan Pernikahan"),
        centerTitle: true,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat, // Sets FAB location
      floatingActionButton: Column(
        mainAxisAlignment:
            MainAxisAlignment.end, // Ensures FAB is at the bottom
        children: [
          ElevatedButton.icon(
            onPressed: () async {
              sendWhatsAppMessage(id_user, phone_number,
                  id_pesanan: id_pesanan);
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  Image.asset("images/account_circle_blue.png"),
                  Text("Muhammad Amazon")
                ],
              ),
            ),
            Divider(),
            MyOrderCustTable(),
            Divider(),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Orderdetail();
                }));
              },
              child: Container(
                child: Column(
                  children: [
                    Text("Diperbaharui 1 Januari 2024, 13.00"),
                    Container(
                      child: Column(
                        children: [
                          Text("Status Terkini"),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Orderdetail();
                                }));
                              },
                              child: Text("Menunggu Pembayaran Awal"))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(),
            Container(
              child: Column(
                children: [
                  Text("MONITORING PERSIAPAN"),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return WeddingEssentialsDetail();
                      }));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[100],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blueAccent),
                      ),
                      child: Column(
                        children: [
                          taskTile('Kerja Sama Vendor', '5/5'),
                          taskTile('Persiapan Akhir', '0/6'),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Container(
              child: Column(
                children: [
                  SupportDocumentProfile(pdfURL: pdfURL),
                  SupportDocumentProfile(pdfURL: pdfURL),
                  SupportDocumentProfile(pdfURL: pdfURL),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }

  Widget taskTile(String task, String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListTile(
        leading:
            Icon(Icons.radio_button_unchecked, color: Colors.blueGrey[700]),
        title: Text(task, style: TextStyle(fontSize: 16)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(date, style: TextStyle(color: Colors.grey)),
            SizedBox(width: 8),
            Icon(Icons.more_horiz, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

class SupportDocumentProfile extends StatelessWidget {
  const SupportDocumentProfile({
    super.key,
    required this.pdfURL,
  });

  final String pdfURL;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(10)),
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      // Wrap with Flexible to allow wrapping
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 190),
                        child: Text(
                          softWrap: true,
                          overflow: TextOverflow.visible,
                          "Notulensi Rapat Perdana",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Flexible(
                      // Wrap the Column inside Flexible as well
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            "Diperbaharui pada",
                            style: TextStyle(fontSize: 11),
                          ),
                          Text(
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            "Rabu, 1 Januari 2024, 10.00",
                            style: TextStyle(fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return OrderPDFView(url: pdfURL);
                      }));
                    },
                    child: Text("Lihat PDF"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
