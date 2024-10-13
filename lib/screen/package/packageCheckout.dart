import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:storease_mobileapp_dev/screen/components/my_order_cust_table.dart';
import 'package:storease_mobileapp_dev/screen/order/order.dart';
import 'package:storease_mobileapp_dev/screen/vr/vrDisplay.dart';

class PackageCheckout extends StatefulWidget {
  const PackageCheckout({super.key});

  @override
  State<PackageCheckout> createState() => _PackageCheckoutState();
}

class _PackageCheckoutState extends State<PackageCheckout> {
  DateTime? _dateTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDateFormatting('id_ID', null);
  }

  void _selectDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
    ).then((value) {
      if (value != null) {
        setState(() {
          _dateTime = value; // Set the selected date
        });
      }
    });
  }

  String formatDate(DateTime date) {
    return DateFormat('d MMMM yyyy', 'id_ID').format(date);
  }
  
  // Method to handle the "Buat Pesanan" button press
  void _onBuatPesananPressed() {
    if (_dateTime == null) {
      // If no date has been selected, show a SnackBar warning
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a wedding date before proceeding.'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      // If a date has been selected, proceed to the next page (Order page)
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Order(); // Replace with your Order page
      }));
    }
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
          onPressed: _onBuatPesananPressed,
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
                    "Tanggal Pernikahan",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                    ElevatedButton(
                      onPressed: _selectDate,
                      child: Text(
                        _dateTime == null
                            ? "Pilih Tanggal Pernikahan" // If no date selected, show placeholder text
                            : formatDate(_dateTime!), // Display the selected date
                      ),
                    ),
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
