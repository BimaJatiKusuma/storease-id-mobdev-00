import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/screen/order/orderDetail.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  // This will track the current index of the selected tab
  int selectedTabIndex = 0;

  // List of order categories (acting as tabs)
  final List<String> tabs = [
    "Jadwal Rapat",
    "Rapat Perdana",
    "Pembayaran Awal",
    "Verifikasi Pembayaran Awal",
    "Proses Persiapan Awal",
    "Verifikasi Pembayaran Akhir",
    "Pembayaran Akhir",
    "Persiapan Akhir",
    "Hari Pernikahan",
    "Pelaporan Akhir",
    "Selesai",
  ];

  // Example orders for each category (you can replace with your own data)
  final Map<String, List<String>> orders = {
    "Jadwal Rapat": ["Order 1"],
    "Rapat Perdana": ["Order 2"],
    "Pembayaran Awal": ["Order 3"],
    "Verifikasi Pembayaran Awal": ["Order 4"],
    "Proses Persiapan Awal": ["Order 5"],
    "Verifikasi Pembayaran Akhir": ["Order 6"],
    "Pembayaran Akhir": ["Order 7"],
    "Persiapan Akhir": ["Order 8"],
    "Hari Pernikahan": ["Order 9"],
    "Pelaporan Akhir": ["Order 10"],
    "Selesai": ["Order 11"],
  };

  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Order"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            // Handle back button press
          },
        ),
      ),
      body: Column(
        children: [
          // Custom tab bar (the chips)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: List.generate(tabs.length, (index) {
                  return OrderStatusChip(
                    label: tabs[index],
                    isActive: selectedTabIndex == index,
                    onSelected: () {
                      setState(() {
                        selectedTabIndex = index;
                      });
                      _pageController.animateToPage(
                        index,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  );
                }),
              ),
            ),
          ),
          // Expanded section where content changes based on selected tab
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: tabs.length,
              onPageChanged: (index) {
                setState(() {
                  selectedTabIndex = index;
                });
              },
              itemBuilder: (context, index) {
                // Display orders related to the selected tab
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: orders[tabs[index]]!.length,
                        itemBuilder: (context, orderIndex) {
                          // return ListTile(
                          //   title: Text(orders[tabs[index]]![orderIndex]),
                          // );
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return Orderdetail();
                              }));
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Vendor | Category",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Text("Harap Melakukan Pembayaran Awal",
                                          style: TextStyle(fontSize: 12))
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: MyColor.colorSecondary,
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  "The Grand Karunia Function Hall - Bogor",
                                                  softWrap: true,
                                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                              Text("ID Pesanan : xxx-xxx-xxx",
                                                  style: TextStyle(fontSize: 12)),
                                              Text("Total harga : Rp. 10.000.000",
                                                  style: TextStyle(fontSize: 12)),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    ElevatedButton(
                                                        onPressed: () {},
                                                        child: Text("Bayar"))
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
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: MyColor.colorSecondary
                      ),
                      child: Column(
                        children: [
                          Text("INFORMASI TAHAPAN", style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Container(
                            child: Text(
                              textAlign: TextAlign.justify,
                              "Pada tahap “Rapat Perdana” pelanggan akan mendapatkan jadwal pertmuan pertama dengan tim storease. Rapat ini akan membahas lebih lanjut mengenai paket yang dipesan oleh pelanggan. Pelanggan bisa melakukan permintaan khusus di dalam paket yang sudah dipilih. Perubahan paket bisa menyebabkan perubahan harga. Rapat perdana ini gratis tidak dipungut biaya."
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 25,)
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OrderStatusChip extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onSelected;

  const OrderStatusChip({
    required this.label,
    required this.isActive,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isActive ? Colors.blue[100] : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isActive ? Colors.blue : Colors.grey,
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.blue : Colors.grey,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
