import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/model/orderResponseModel.dart';
import 'package:storease_mobileapp_dev/screen/order/orderDetail.dart';

class Order extends StatefulWidget {
  final OrderResponseModel orderData;
  const Order({super.key, required this.orderData});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  int curretnStep = 0;

  

  @override
  void initState() {
    super.initState();
    curretnStep = mapStatusToStep(widget.orderData.status);
  }

  // Function to map status to step index
  int mapStatusToStep(int status) {
    switch (status) {
      case 1:
        return 0; // Penentuan Jadwal Rapat Perdana
      case 2:
        return 1; // Rapat Perdana
      case 3:
        return 2; // Pembayaran Awal
      case 4:
        return 3; // Persiapan Awal
      case 5:
        return 4; // Pembayaran Akhir
      case 6:
        return 5; // Persiapan Akhir
      case 7:
        return 6; // Hari Pernikahan
      case 8:
        return 7; // Pelaporan Akhir
      default:
        return 0;
    }
  }

  onStep(int value) {
    setState(() {
      curretnStep = value;
    });
  }

  Widget controlsBuilder(context, details) {
    return SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ORDER"),
      ),
      body: SafeArea(
        child: Stepper(
          currentStep: curretnStep,
          // onStepTapped: onStep,
          controlsBuilder: controlsBuilder,
          steps: [
            Step(
              title: Text("Penentuan Jadwal Rapat Perdana"),
              content: OrderContent(currentStep: curretnStep),
              state: curretnStep > 0 ? StepState.complete : StepState.indexed,
              isActive: curretnStep >= 0,
            ),
            Step(
              title: Text("Rapat Perdana"),
              content: OrderContent(currentStep: curretnStep),
              state: curretnStep > 1 ? StepState.complete : StepState.indexed,
              isActive: curretnStep >= 1,
            ),
            Step(
              title: Text("Pembayaran Awal"),
              content: OrderContent(currentStep: curretnStep),
              state: curretnStep > 2 ? StepState.complete : StepState.indexed,
              isActive: curretnStep >= 2,
            ),
            Step(
              title: Text("Persiapan Awal"),
              content: OrderContent(currentStep: curretnStep),
              state: curretnStep > 3 ? StepState.complete : StepState.indexed,
              isActive: curretnStep >= 3,
            ),
            Step(
              title: Text("Pembayaran Akhir"),
              content: OrderContent(currentStep: curretnStep),
              state: curretnStep > 4 ? StepState.complete : StepState.indexed,
              isActive: curretnStep >= 4,
            ),
            Step(
              title: Text("Persiapan Akhir"),
              content: OrderContent(currentStep: curretnStep),
              state: curretnStep > 5 ? StepState.complete : StepState.indexed,
              isActive: curretnStep >= 5,
            ),
            Step(
              title: Text("Hari Pernikahan"),
              content: OrderContent(currentStep: curretnStep),
              state: curretnStep > 6 ? StepState.complete : StepState.indexed,
              isActive: curretnStep >= 6,
            ),
            Step(
              title: Text("Pelaporan Akhir"),
              content: OrderContent(currentStep: curretnStep,),
              state: curretnStep > 7 ? StepState.complete : StepState.indexed,
              isActive: curretnStep >= 7,
            ),
          ],
        ),
      ),
    );
  }
}


class OrderContent extends StatelessWidget {
  final int currentStep;
  const OrderContent({super.key, required this.currentStep});

  description<String>(){
    switch (currentStep){
      case 1:
        return "Tahap Penentuan Jadwal Perdana, adalah tahap untuk customer dan tim storease melakukan rapat pertama. Admin akan menghubungi customer sesaat setelah customer membuat pesanan. Customer bisa menghubungi tim storease apabila belum mendapatkan konfirmasi jadwal rapat perdana";
      case 2:
        return "Tahap Rapat Perdana, adalah tahap untuk customer dan tim storease melakukan rapat pertama. Admin akan menghubungi customer sesaat setelah customer membuat pesanan. Customer bisa menghubungi tim storease apabila belum mendapatkan konfirmasi jadwal rapat perdana";
      case 3:
        return "Tahap Pembayaran Awal, adalah tahap untuk customer dan tim storease melakukan rapat pertama. Admin akan menghubungi customer sesaat setelah customer membuat pesanan. Customer bisa menghubungi tim storease apabila belum mendapatkan konfirmasi jadwal rapat perdana";
      case 4:
        return "Tahap Persiapan Awal, adalah tahap untuk customer dan tim storease melakukan rapat pertama. Admin akan menghubungi customer sesaat setelah customer membuat pesanan. Customer bisa menghubungi tim storease apabila belum mendapatkan konfirmasi jadwal rapat perdana";
      case 5:
        return "Tahap Pembayaran Akhir, adalah tahap untuk customer dan tim storease melakukan rapat pertama. Admin akan menghubungi customer sesaat setelah customer membuat pesanan. Customer bisa menghubungi tim storease apabila belum mendapatkan konfirmasi jadwal rapat perdana";
      case 6:
        return "Tahap Persiapan Akhir, adalah tahap untuk customer dan tim storease melakukan rapat pertama. Admin akan menghubungi customer sesaat setelah customer membuat pesanan. Customer bisa menghubungi tim storease apabila belum mendapatkan konfirmasi jadwal rapat perdana";
      case 7:
        return "Tahap Hari Pernikahan, adalah tahap untuk customer dan tim storease melakukan rapat pertama. Admin akan menghubungi customer sesaat setelah customer membuat pesanan. Customer bisa menghubungi tim storease apabila belum mendapatkan konfirmasi jadwal rapat perdana";
      case 8:
        return "Tahap Pelaporan Akhir, adalah tahap untuk customer dan tim storease melakukan rapat pertama. Admin akan menghubungi customer sesaat setelah customer membuat pesanan. Customer bisa menghubungi tim storease apabila belum mendapatkan konfirmasi jadwal rapat perdana";

    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Text(description())
      );
  }
}

// class OrderContent extends StatelessWidget {
//   const OrderContent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // Navigator.push(context, MaterialPageRoute(builder: (context) {
//         //   return Orderdetail();
//         // }));
//       },
//       child: Container(
//         padding: EdgeInsets.all(10),
//         decoration: BoxDecoration(
//             border: Border.all(color: Colors.black),
//             borderRadius: BorderRadius.all(Radius.circular(10))),
//         width: double.infinity,
//         margin: EdgeInsets.symmetric(horizontal: 10),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Vendor | Category",
//                   style: TextStyle(fontSize: 12),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 // Ensure that the Column expands within the Row
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment:
//                         CrossAxisAlignment.start, // Align the text to the start
//                     children: [
//                       // Text will wrap to the next line if it exceeds the available width
//                       Text(
//                         textAlign: TextAlign.end,
//                         "Harap Melakukan Pembayaran Awal",
//                         style: TextStyle(fontSize: 12),
//                         softWrap: true, // Enables text to wrap
//                         overflow: TextOverflow
//                             .visible, // Ensure overflow handling is visible
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             Container(
//               padding: EdgeInsets.all(5),
//               decoration: BoxDecoration(
//                   color: MyColor.colorSecondary,
//                   borderRadius: BorderRadius.all(Radius.circular(10))),
//               width: double.infinity,
//               child: Column(
//                 children: [
//                   Container(
//                       width: 150,
//                       child: Image.asset(
//                         "images/venue_image.png",
//                         fit: BoxFit.cover,
//                       )),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Container(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("The Grand Karunia Function Hall - Bogor",
//                             softWrap: true,
//                             style: TextStyle(
//                                 fontSize: 12, fontWeight: FontWeight.bold)),
//                         Text("ID Pesanan : xxx-xxx-xxx",
//                             style: TextStyle(fontSize: 12)),
//                         Text("Total harga : Rp. 10.000.000",
//                             style: TextStyle(fontSize: 12)),
//                         Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               ElevatedButton(
//                                   onPressed: () {
//                                     // Navigator.push(context,
//                                     //     MaterialPageRoute(builder: (context) {
//                                     //   return Orderdetail();
//                                     // }));
//                                   },
//                                   child: Text("Detail"))
//                             ])
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
