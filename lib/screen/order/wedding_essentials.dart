import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/api/api_services.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/method/send_whatsapp_message.dart';
import 'package:storease_mobileapp_dev/model/orderResponseModel.dart';
import 'package:storease_mobileapp_dev/model/profileResponseModel.dart';
import 'package:storease_mobileapp_dev/screen/ai/ai.dart';
import 'package:storease_mobileapp_dev/screen/auth/Login.dart';
import 'package:storease_mobileapp_dev/screen/components/my_order_cust_table.dart';
import 'package:storease_mobileapp_dev/screen/order/order.dart';
import 'package:storease_mobileapp_dev/screen/order/orderDetail.dart';
import 'package:storease_mobileapp_dev/screen/order/orderPDFview.dart';
import 'package:storease_mobileapp_dev/screen/order/wedding_essentials_detail.dart';
import 'package:storease_mobileapp_dev/screen/payment/payment.dart';
import 'package:storease_mobileapp_dev/screen/vr/vrDisplay.dart';

class WeddingEssentials extends StatefulWidget {
  final OrderResponseModel orderData;
  const WeddingEssentials({super.key, required this.orderData});

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
  bool _isLoading = true; // Default to true to indicate loading
  ProfileResponseModel? userData; // Use nullable type

  @override
  void initState() {
    super.initState();
    loadUserProfile();
  }

  Future<void> loadUserProfile() async {
    ApiServices apiServices = ApiServices();
    apiServices.getProfile().then((value) {
      if (value != null) {
        setState(() {
          userData = value; // Assign userData when data is loaded
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Login()),
          (Route<dynamic> route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AIPage();
              }));
            },
            icon: Image.asset("images/Ai.png"),
          ),
        ],
        title: Text("Kelengkapan Pernikahan"),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton.icon(
            onPressed: () async {
              sendWhatsAppMessage(id_user, phone_number,
                  id_pesanan: id_pesanan);
            },
            icon: Icon(Icons.message, size: 18),
            label: Text("Chat Admin"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue,
              side: BorderSide(color: Colors.blue),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Text("Diperbaharui 1 Januari 2024, 13.00"),
                        Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return Order(
                                          orderData: widget.orderData,
                                        );
                                      }));
                                    },
                                    child: Column(
                                      children: [
                                        Text("status"),
                                        Text("2/7"),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text("Menunggu Pembayaran Awal"),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return Payment();
                                          }));
                                        },
                                        child: Text("Bayar"),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    child: Column(
                      children: [
                        Text("Tanggal Pernikahan"),
                        Text("24 OKTOBER 2024")
                      ],
                    ),
                    // width: double.infinity,
                    // child: Column(
                    //   children: [
                    //     Image.asset("images/account_circle_blue.png"),
                    //     Text(userData?.name ??
                    //         "Loading..."), // Safely access userData
                    //   ],
                    // ),
                  ),
                  Divider(),
                  MyOrderCustTable(
                    isLoading: _isLoading,
                    profile:
                        userData!, // Use non-null assertion since it's loaded
                  ),
                  ExpansionTile(
                    collapsedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    iconColor: MyColor.colorSecondary,
                    collapsedIconColor:
                        const Color.fromARGB(255, 238, 243, 155),
                    collapsedBackgroundColor: MyColor.color1,
                    backgroundColor: MyColor.colorMain,
                    title: Text("Package by The Amaryllis Boutique Resort"),
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
                                  const Text(
                                      "Wedding orgenizer by Storease \n-	Konultasi konsep acara wedding (resepsi)\n-	Konsep wedding \n-	Rundown wedding\n-	1 x visit venue\n-	3x meeting (client, keluarga, all vendor/final)\n-	Manage vendor installation( loading catring sound, decoration)\n-	1 projek Manager 4 crew\n-	Undangan digital\n\nDécor by Yulis\n-	Dekorasi saat akad nikah (meja + kursi akad) 4 x 4\n-	Backdrop \n-	Dekorasi bunga\n-	Welcome sign\n-	Kotak uang 2\n-	Hand bouquet fresh flower\n-	Dekor pintu masuk\n\nMUA & Dress by Kholid\n  Mackup kedua mempelai\n-	1 busana akad\n-	1 busana temu tamu\n-	1 busana resepsi\n-	Melati akad non adat \n-	Softlens normal\n-	Henna  tangan\n-	Nail art\n\nDokumentasi By Dig Studio\n-	Unlimited photo +/- 4 jam\n-	Weeding box 50 pages\n-	1 photo printed 16 Rs (40 x 60 Cm)\n-	1 big frame 16 Rs\n-	1 photografer\n-	File in flasdisk"),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  const Text(
                                    "Preview",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                      "* Down Payment: 40%\n*Pembayaran Kedua: 40%\nPembayaran Terakhir: 20%"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
                        Text("DOKUMEN"),
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
