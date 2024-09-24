import 'package:url_launcher/url_launcher.dart';

// Function to send WhatsApp message
Future<void> sendWhatsAppMessage(String id_user, String phone_number, {String id_pesanan = ""}) async {
  final String phoneNumber = phone_number;
  String message;

  // If id_pesanan is empty, use a different method
  if (id_pesanan.isEmpty) {
    message = "*ID Pelanggan : ${id_user}*\n=======================\n";  // No order ID
  } else {
    message = "*ID Pelanggan : ${id_user}*\n*ID Pesanan : ${id_pesanan}*\n=======================\n";  // With order ID
  }

  final Uri whatsappUrl = Uri.parse("https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}");

  if (await canLaunchUrl(whatsappUrl)) {
    await launchUrl(whatsappUrl);
  } else {
    throw 'Could not launch $whatsappUrl';
  }
}
