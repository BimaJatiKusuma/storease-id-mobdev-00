import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/method/send_whatsapp_message.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  String user_id = "123455";
  String phone_number = "+6285895929918";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pusat Bantuan")
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat, // Sets FAB location
      floatingActionButton: Column(
        mainAxisAlignment:
            MainAxisAlignment.end, // Ensures FAB is at the bottom
        children: [
          ElevatedButton.icon(
            onPressed: () async {
              sendWhatsAppMessage(user_id, phone_number);
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
            Text("Pusat Bantuan Storease"),
            Text("Pusat Bantuan Storease berisi panduan dalam penggunaan aplikasi dan layanan yang diberikan. Apabila terdapat kebingungan dari penjelasan yang tersedia, pelanggan bisa menghubungi admin Storease melalui tombol dibawah"),
            Text("Tata urutan pemesanan"),
            Text("1. Menunggu Jadwal Rapat"),
            Text("Setelah pelanggan melakukan pemesanan melalui aplikasi, admin Storease akan menghubungi pelanggan melalui nomor whatsapp yang terdaftar. Pada tahap ini, pelanggan dan admin menyepakai jadwal melakukan rapat untuk membahas detail pemesanan lebih lanjut")
          ],
        ),
      ),
    );
  }
}