import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/screen/components/my_content_homepage_vendor.dart';
import 'package:storease_mobileapp_dev/screen/components/my_content_vendor_detail_produk_review_tile.dart';
import 'package:storease_mobileapp_dev/screen/vendor/vendor.dart';
import 'package:storease_mobileapp_dev/screen/vr/vrDisplay.dart';
import 'package:table_calendar/table_calendar.dart';

class VendorDetailProduct extends StatefulWidget {
  const VendorDetailProduct({super.key});

  @override
  State<StatefulWidget> createState() {
    return _VendorDetailProductState();
  }
}

class _VendorDetailProductState extends State<VendorDetailProduct> {
  DateTime _dateTime = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay(hour: 7, minute: 0);

  void _selectDate() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 5)).then((value){
          setState(() {
            _dateTime = value!;
          });
        });
  }

  void _selectTime() {
    showTimePicker(
        context: context,
        initialTime: _timeOfDay
    ).then((pickedTime){
      if (pickedTime != null){
        setState(() {
          _timeOfDay = pickedTime;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Produk"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.grey.shade300),
                      height: 200,
                      child: Image.asset(
                        "images/venue_image.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxHeight: 50,
                      ),
                      child: const Text(
                        "The Amaryllis Boutique Resort",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(color: Colors.grey.shade200),
                      height: 100,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 50,
                            child:
                                Image.asset("images/account_circle_blue.png"),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "[Nama Vendor]",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("123 produk"),
                                    Text("4.8 penilaian")
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Vendor();
                              }));
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.only(
                                top: 0,
                                bottom: 0,
                                left: 5,
                                right: 5,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: const Text("Kunjungi Vendor"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(color: Colors.grey.shade200),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Detail",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "Ini adalah detail dari produk yang berisi deskripsi mendalam. \n Ini adalah list 1\nlist 2\nini adalah deskripsi yang bisa diberikan oleh vendor",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Pembayaran",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "* Down Payment: 40%\n*Pembayaran Kedua: 40%\nPembayaran Terakhir: 20%",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
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
                            child:
                                Image.asset("images/icon_virtual_reality.png"),
                          ),
                          Text("Tanggal Pernikahan: ${_dateTime.toLocal()}"),
                          ElevatedButton(
                              onPressed: () {
                                _selectDate();
                              },
                              child: Text("${_dateTime.toLocal()}")),
                          Text(
                              "Waktu Pernikahan: ${_timeOfDay.format(context)}"),
                          ElevatedButton(
                              onPressed: () {
                                _selectTime();
                              },
                              child: Text("${_timeOfDay}")),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Reviewed (3)"),
                            RichText(
                              text: TextSpan(
                                text: "Lihat semua...",
                                style: const TextStyle(
                                  color: MyColor.color1,
                                  decoration: TextDecoration.underline,
                                  fontFamily: 'Poppins',
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Navigate to all review page
                                  },
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        VendorDetailProdukReviewTile(),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(),
                        const MyContentHomepageVendor(title: "Other"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Pricelist"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Chat Vendor"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

