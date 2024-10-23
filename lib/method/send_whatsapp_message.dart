import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:storease_mobileapp_dev/method/secure_storage.dart';
import 'package:url_launcher/url_launcher.dart';

// Function to send WhatsApp message
Future<void> sendWhatsAppMessage({String id_pesanan = "", String nama_pesanan = ""}) async {
  String userID = await  SecureStorage().readSecureData(dotenv.env["KEY_USER_ID"]!);
  String phoneCS = await  SecureStorage().readSecureData(dotenv.env["KEY_CUSTOMER_SERVICE"]!);
  final String phoneNumber = phoneCS;
  String message;

  // If id_pesanan is empty, use a different method
  if (id_pesanan.isEmpty) {
    message = "*ID Pelanggan : ${userID}*\n==================\n tuliskan pesan anda:\n";  // No order ID
  } else {
    message = "*ID Pelanggan : ${userID}*\n*Nama Paket : ${nama_pesanan} - kode  ${id_pesanan}*\n==================\n tulis pesan anda:\n";  // With order ID
  }

  final Uri whatsappUrl = Uri.parse("https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}");

  if (await canLaunchUrl(whatsappUrl)) {
    await launchUrl(whatsappUrl);
  } else {
    throw 'Could not launch $whatsappUrl';
  }
}
