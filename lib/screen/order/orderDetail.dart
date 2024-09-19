import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/screen/components/my_order_cust_table.dart';
import 'package:storease_mobileapp_dev/screen/vr/vrDisplay.dart';

class Orderdetail extends StatefulWidget {
  const Orderdetail({super.key});

  @override
  State<Orderdetail> createState() => _OrderdetailState();
}

class _OrderdetailState extends State<Orderdetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Detail Pesanan"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Text("MENUNGGU JADWAL RAPAT PERTAMA"),
            ),
            MyOrderCustTable(),
            ExpansionTile(
              title: Text("Package by The Amaryllis Boutiqe Resort"),
              children: [
                Container(
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
                            Text(
                                "Ini adalah detail dari produk yang berisi deskripsi mendalam. \n Ini adalah list 1\nlist 2\nini adalah deskripsi yang bisa diberikan oleh Package")
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
              ],
            ),
            ElevatedButton(onPressed: (){
              
            }, child: Text("Lihat PDF"))
          ],
        ),
      ),
    );
  }
}
