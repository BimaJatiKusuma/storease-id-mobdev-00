// import 'package:flutter/material.dart';
// import 'package:storease_mobileapp_dev/api/api_services.dart';
// import 'package:storease_mobileapp_dev/color/color.dart';
// import 'package:storease_mobileapp_dev/model/profileResponseModel.dart';
// import 'package:storease_mobileapp_dev/screen/components/my_order_cust_table.dart';
// import 'package:storease_mobileapp_dev/method/send_whatsapp_message.dart';
// import 'package:storease_mobileapp_dev/screen/order/orderPDFview.dart';
// import 'package:storease_mobileapp_dev/screen/payment/payment.dart';
// import 'package:storease_mobileapp_dev/screen/vr/vrDisplay.dart';

// class Orderdetail extends StatefulWidget {
//   const Orderdetail({super.key});

//   @override
//   State<Orderdetail> createState() => _OrderdetailState();
// }

// class _OrderdetailState extends State<Orderdetail> {

//   final String laporanRapatPerdanaURL =
//       "https://unej.ac.id/wp-content/uploads/2022/06/Buku-Akademik-UNEJ-14-Oktober-2021-1.pdf";
//   final String id_user = "ini id user";
//   final String id_pesanan = "ini id pesanan";
//   final String phone_number = "+6285895929918";

//   bool _isLoading = true;
//   late ProfileResponseModel profile;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//       _loadUser();
//   }

//   void safeSetState(VoidCallback fn) {
//     if (mounted) {
//       setState(fn);
//     }
//   }
//     Future<void> _loadUser() async {
//     ApiServices apiServices = ApiServices();
//     try {
//       ProfileResponseModel fetchedProfile = await apiServices.getProfile();
//       safeSetState(() {
//         profile = fetchedProfile;
//       });
//       _isLoading = false;
//     } catch (error) {
//       // Handle error here if needed
//       print(error);
//       _isLoading = false;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: false,
//         title: Text("Detail Pesanan"),
//       ),
//       floatingActionButtonLocation:
//           FloatingActionButtonLocation.centerFloat, // Sets FAB location
//       floatingActionButton: Column(
//         mainAxisAlignment:
//             MainAxisAlignment.end, // Ensures FAB is at the bottom
//         children: [
//           ElevatedButton.icon(
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) {
//                 return Payment();
//               }));
//             },
//             icon: Icon(Icons.payment, size: 18), // Use the desired icon
//             label: Text("Bayar"),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.white, // Set background color
//               foregroundColor: Colors.blue, // Set text and icon color
//               side: BorderSide(
//                   color: Colors.blue), // Border color matching the style
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(30), // Rounded shape
//               ),
//               padding: EdgeInsets.symmetric(
//                   horizontal: 16), // Padding inside the button
//             ),
//           ),
//           SizedBox(height: 10), // Adds some space between the two buttons
//           ElevatedButton.icon(
//             onPressed: () async {
//               sendWhatsAppMessage(id_user, phone_number,
//                   id_pesanan: id_pesanan);
//             },
//             icon: Icon(Icons.message, size: 18), // Use the desired icon
//             label: Text("Chat Admin"),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.white, // Set background color
//               foregroundColor: Colors.blue, // Set text and icon color
//               side: BorderSide(
//                   color: Colors.blue), // Border color matching the style
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(30), // Rounded shape
//               ),
//               padding: EdgeInsets.symmetric(
//                   horizontal: 16), // Padding inside the button
//             ),
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: _isLoading? Center(child: CircularProgressIndicator(),) : SingleChildScrollView(
//           padding: EdgeInsets.symmetric(horizontal: 10),
//           child: Column(
//             children: [
//               Container(
//                 padding: EdgeInsets.all(10),
//                 width: double.infinity,
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                     color: MyColor.colorSecondary,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Text(
//                   "MENUNGGU JADWAL RAPAT PERTAMA",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                 ),
//               ),
//               SizedBox(height: 20),
//               MyOrderCustTable(profile: profile, isLoading: _isLoading,),
//               SizedBox(height: 20),
//               ExpansionTile(
//                 collapsedShape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)),
//                 iconColor: MyColor.colorSecondary,
//                 collapsedIconColor: const Color.fromARGB(255, 238, 243, 155),
//                 collapsedBackgroundColor: MyColor.color1,
//                 backgroundColor: MyColor.colorMain,
//                 title: Text("Package by The Amaryllis Boutique Resort"),
//                 children: [
//                   Container(
//                     padding: EdgeInsets.all(5),
//                     decoration: BoxDecoration(color: Colors.grey.shade300),
//                     child: Column(
//                       children: [
//                         Container(
//                           color: Colors.amber,
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                 height: 175,
//                                 child: SingleChildScrollView(
//                                   scrollDirection: Axis.horizontal,
//                                   child: Row(
//                                     children: List.generate(4, (index) {
//                                       return Container(
//                                         margin: EdgeInsets.all(2),
//                                         height: double.infinity,
//                                         child: Image.asset(
//                                             "images/venue_image.png",
//                                             fit: BoxFit.cover),
//                                       );
//                                     }),
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                         Container(
//                           child: Column(
//                             children: [
//                               Text("Detail"),
//                               const Text(
//                                   "Wedding orgenizer by Storease \n-	Konultasi konsep acara wedding (resepsi)\n-	Konsep wedding \n-	Rundown wedding\n-	1 x visit venue\n-	3x meeting (client, keluarga, all vendor/final)\n-	Manage vendor installation( loading catring sound, decoration)\n-	1 projek Manager 4 crew\n-	Undangan digital\n\nDécor by Yulis\n-	Dekorasi saat akad nikah (meja + kursi akad) 4 x 4\n-	Backdrop \n-	Dekorasi bunga\n-	Welcome sign\n-	Kotak uang 2\n-	Hand bouquet fresh flower\n-	Dekor pintu masuk\n\nMUA & Dress by Kholid\n  Mackup kedua mempelai\n-	1 busana akad\n-	1 busana temu tamu\n-	1 busana resepsi\n-	Melati akad non adat \n-	Softlens normal\n-	Henna  tangan\n-	Nail art\n\nDokumentasi By Dig Studio\n-	Unlimited photo +/- 4 jam\n-	Weeding box 50 pages\n-	1 photo printed 16 Rs (40 x 60 Cm)\n-	1 big frame 16 Rs\n-	1 photografer\n-	File in flasdisk"),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           child: Column(
//                             children: [
//                               const Text(
//                                 "Preview",
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                               ElevatedButton(
//                                 onPressed: () {
//                                   Navigator.push(context,
//                                       MaterialPageRoute(builder: (context) {
//                                     return VRDisplay();
//                                   }));
//                                 },
//                                 child: Image.asset(
//                                     "images/icon_virtual_reality.png"),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           child: Column(
//                             children: [
//                               Text(
//                                 "Rincian Pembayaran",
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                               Text(
//                                   "* Down Payment: 40%\n*Pembayaran Kedua: 40%\nPembayaran Terakhir: 20%"),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               Container(
//                 decoration: BoxDecoration(
//                     color: Colors.amber,
//                     borderRadius: BorderRadius.circular(10)),
//                 width: double.infinity,
//                 padding: EdgeInsets.all(10),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Flexible(
//                           // Wrap with Flexible to allow wrapping
//                           child: Container(
//                             constraints: BoxConstraints(maxWidth: 190),
//                             child: Text(
//                               softWrap: true,
//                               overflow: TextOverflow.visible,
//                               "Notulensi Rapat Perdana",
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                         Flexible(
//                           // Wrap the Column inside Flexible as well
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               Text(
//                                 softWrap: true,
//                                 overflow: TextOverflow.visible,
//                                 "Diperbaharui pada",
//                                 style: TextStyle(fontSize: 11),
//                               ),
//                               Text(
//                                 softWrap: true,
//                                 overflow: TextOverflow.visible,
//                                 "Rabu, 1 Januari 2024, 10.00",
//                                 style: TextStyle(fontSize: 11),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 10),
//                     Container(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.push(context,
//                               MaterialPageRoute(builder: (context) {
//                             return OrderPDFView(url: laporanRapatPerdanaURL);
//                           }));
//                         },
//                         child: Text("Lihat PDF"),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 75),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
