import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:storease_mobileapp_dev/api/api_services.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/method/send_whatsapp_message.dart';
import 'package:storease_mobileapp_dev/model/orderResponseModel.dart';
import 'package:storease_mobileapp_dev/model/packageResponseModel.dart';
import 'package:storease_mobileapp_dev/model/profileResponseModel.dart';
import 'package:storease_mobileapp_dev/screen/ai/aiOrder.dart';
import 'package:storease_mobileapp_dev/screen/auth/Login.dart';
import 'package:storease_mobileapp_dev/screen/components/my_order_cust_table.dart';
import 'package:storease_mobileapp_dev/screen/components/shimmer_skeleton.dart';
import 'package:storease_mobileapp_dev/screen/order/order.dart';
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
  late PackageModel package;

  @override
  void initState() {
    super.initState();
    loadUserProfile();
  }

  void safeSetState(VoidCallback fn) {
    if (mounted) {
      setState(fn);
    }
  }

  Future<void> loadUserProfile() async {
    ApiServices apiServices = ApiServices();
    apiServices.getProfile().then((value) {
      if (value != null) {
        safeSetState(() {
          userData = value; // Assign userData when data is loaded
          // _isLoading = false;
          _loadPackageByID(widget.orderData.id);
        });
      } else {
        safeSetState(() {
          _isLoading = false;
        });
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Login()),
          (Route<dynamic> route) => false,
        );
      }
    });
  }

  Future<void> _loadPackageByID(int id) async {
    ApiServices apiServices = ApiServices();
    try {
      PackageDetailResponseModel fetchedPackage =
          await apiServices.getPackagByID(id);
      safeSetState(() {
        package = fetchedPackage.package;
        _isLoading = false;
      });
    } catch (error) {
      // Handle error here if needed
      // Optionally, show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load package: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            width: 50,
            child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AIPageOrder();
                }));
              },
              icon: Image.asset("images/Ai.png"),
            ),
          ),
        ],
        title: Text("Kelengkapan Pernikahan"),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _isLoading
          ? Container(
              height: 20,
              width: 30,
              child: ShimmerSkeleton(),
            )
          : Column(
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
          ? WeddingEssentialsLoading()
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
                                        Text("${widget.orderData.status}/7"),
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
                        Text(
                          "Tanggal Pernikahan",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "24 OKTOBER 2024",
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
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
                  SizedBox(
                    height: 10,
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
                    title: Text(package.title),
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(color: Colors.grey.shade300),
                        child: Column(
                          children: [
                            Container(
                              height:
                                  300, // Set the height for the row of images
                              child: ListView.builder(
                                scrollDirection: Axis
                                    .horizontal, // Enables horizontal scrolling
                                itemCount: package?.image_url.length ??
                                    0, // Number of images
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: MediaQuery.of(context)
                                        .size
                                        .width, // Set a width for each image
                                    margin: const EdgeInsets.only(
                                        right: 10), // Spacing between images
                                    decoration:
                                        BoxDecoration(color: Colors.white),
                                    child: Image.network(
                                      package!.image_url[index],
                                      fit: BoxFit.contain,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Text("Detail"),
                                  Html(
                                    data: package.description,
                                    style: {
                                      "p": Style(
                                        fontSize: FontSize(16.0),
                                        margin:
                                            Margins.symmetric(vertical: 4.0),
                                      ),
                                      "b": Style(
                                          fontSize: FontSize(16.0),
                                          fontWeight: FontWeight.bold)
                                    },
                                  ),
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
                                        return VRDisplay(
                                          title: package.title,
                                        );
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
                                      "* Down Payment: 60%\n* Final Payment: 40%"),
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
                        Text(
                          "MONITORING PERSIAPAN",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
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
                            ),
                            child: Column(
                              children: [
                                taskTile('Persiapan Awal', '5/5'),
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
                        Text(
                          "DOKUMEN",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SupportDocumentProfile(
                          pdfURL: "https://be.storease.id/media/31/Notulensi-Rapat-Perencanaan-Wedding.pdf",
                          title: "Notulensi Rapat Perdana",
                        ),
                        SupportDocumentProfile(
                          pdfURL: "https://be.storease.id/media/32/rundown.pdf",
                          title: "Rundown Acara",
                        ),
                        SupportDocumentProfile(
                          pdfURL: "https://be.storease.id/media/37/DESAIN-VENUE.pdf",
                          title: "Desain Venue",
                        ),
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
    required this.title,
    super.key,
    required this.pdfURL,
  });

  final String pdfURL;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: MyColor.canvaMainColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10)),
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
                          title,
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
                        return OrderPDFView(url: pdfURL, title: title,);
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

class WeddingEssentialsLoading extends StatelessWidget {
  const WeddingEssentialsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              height: 100,
              width: double.infinity,
              padding: EdgeInsets.all(5),
              child: ShimmerSkeleton()),
          SizedBox(
            height: 10,
          ),
          ShimmerSkeleton(),
          SizedBox(
            height: 10,
          ),
          Container(height: 60, child: ShimmerSkeleton()),
          SizedBox(
            height: 10,
          ),
          ShimmerSkeleton(),
          SizedBox(
            height: 10,
          ),
          Container(
              height: 300, // Set the height for the row of images
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ShimmerSkeleton(
                      width: 150,
                    ),
                  );
                },
              )),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 100,
            child: ShimmerSkeleton(),
          ),
          SizedBox(
            height: 10,
          ),
          Container(height: 100, child: ShimmerSkeleton()),
          SizedBox(
            height: 10,
          ),
          ShimmerSkeleton(),
          SizedBox(
            height: 10,
          ),
          Container(height: 60, child: ShimmerSkeleton()),
          SizedBox(
            height: 10,
          ),
          Container(height: 60, child: ShimmerSkeleton()),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}
