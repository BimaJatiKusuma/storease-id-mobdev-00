import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/screen/order/orderDetail.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  int curretnStep = 0;
  // continueStep(){
  //   setState(() {
  //     curretnStep = curretnStep + 1;
  //   });
  // }
  // cancelStep(){
  //   setState(() {
  //     curretnStep = curretnStep - 1;
  //   });
  // }
  onStep(int value) {
    setState(() {
      curretnStep = value;
    });
  }

  Widget controlsBuilder(context, details) {
    return SizedBox.shrink();
    // return Row(
    //   children: [
    //     ElevatedButton(onPressed: () {}, child: Text("Detail")),
    //   ],
    // );
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
            onStepTapped: onStep,
            controlsBuilder: controlsBuilder,
            steps: const [
              Step(title: Text("Penentuan Jadwal Rapat Perdana"), content: OrderContent()),
              Step(title: Text("Rapat Perdana"), content: OrderContent()),
              Step(title: Text("Pembayaran Awal"), content: OrderContent()),
              Step(title: Text("Persiapan Awal"), content: OrderContent()),
              Step(title: Text("Pembayaran AKhir"), content: OrderContent()),
              Step(title: Text("Persiapan Akhir"), content: OrderContent()),
              Step(title: Text("Hari Pernikahan"), content: OrderContent()),
              Step(title: Text("Pelaporan Akhir"), content: OrderContent()),
            ]),
      ),
    );
  }
}

class OrderContent extends StatelessWidget {
  const OrderContent({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Orderdetail();
        }));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Vendor | Category",
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  width: 10,
                ),
                // Ensure that the Column expands within the Row
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align the text to the start
                    children: [
                      // Text will wrap to the next line if it exceeds the available width
                      Text(
                        textAlign: TextAlign.end,
                        "Harap Melakukan Pembayaran Awal",
                        style: TextStyle(fontSize: 12),
                        softWrap: true, // Enables text to wrap
                        overflow: TextOverflow
                            .visible, // Ensure overflow handling is visible
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: MyColor.colorSecondary,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                      width: 150,
                      child: Image.asset(
                        "images/venue_image.png",
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("The Grand Karunia Function Hall - Bogor",
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold)),
                        Text("ID Pesanan : xxx-xxx-xxx",
                            style: TextStyle(fontSize: 12)),
                        Text("Total harga : Rp. 10.000.000",
                            style: TextStyle(fontSize: 12)),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Orderdetail();
                                    }));
                                  },
                                  child: Text("Detail"))
                            ])
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );

    ;
  }
}
