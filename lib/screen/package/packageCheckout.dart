import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:storease_mobileapp_dev/api/api_services.dart';
import 'package:storease_mobileapp_dev/model/packageResponseModel.dart';
import 'package:storease_mobileapp_dev/model/profileResponseModel.dart';
import 'package:storease_mobileapp_dev/screen/components/my_order_cust_table.dart';
import 'package:storease_mobileapp_dev/screen/components/shimmer_skeleton.dart';
import 'package:storease_mobileapp_dev/screen/order/orderList.dart';
import 'package:storease_mobileapp_dev/screen/vr/vrDisplay.dart';

class PackageCheckout extends StatefulWidget {
  final int id;
  const PackageCheckout({super.key, required this.id});

  @override
  State<PackageCheckout> createState() => _PackageCheckoutState();
}

class _PackageCheckoutState extends State<PackageCheckout> {
  DateTime? _dateTime;
  late PackageModel package;
  ProfileResponseModel? profil; // Made nullable
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('id_ID', null);
    _loadPackageByID(widget.id);
  }

  void safeSetState(VoidCallback fn) {
    if (mounted) {
      setState(fn);
    }
  }

  Future<void> _loadPackageByID(int id) async {
    ApiServices apiServices = ApiServices();
    try {
      PackageModel fetchedPackage = await apiServices.getPackagByID(id);
      safeSetState(() {
        package = fetchedPackage;
      });
      await _loadUser();
    } catch (error) {
      // Handle error here if needed
      print(error);
      safeSetState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _loadUser() async {
    ApiServices apiServices = ApiServices();
    try {
      ProfileResponseModel fetchedProfil = await apiServices.getProfile();
      safeSetState(() {
        profil = fetchedProfil;
        _isLoading = false;
      });
    } catch (error) {
      // Handle error here if needed
      print(error);
      safeSetState(() {
        _isLoading = false;
      });
    }
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
        return OrderList(); // Replace with your Order page
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
                child: _isLoading
                    ? ShimmerSkeleton()
                    : Column(
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
                                  : formatDate(
                                      _dateTime!), // Display the selected date
                            ),
                          ),
                        ],
                      ),
              ),
              MyOrderCustTable(
                profile: profil,
                isLoading: _isLoading,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(color: Colors.grey.shade300),
                child: _isLoading
                    ? ShimmerSkeleton()
                    : Column(
                        children: [
                          Container(
                            child: Text(package.title),
                          ),
                          Container(
                            color: Colors.amber,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 175,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: package.image_url.length,
                                    itemBuilder: (context, index) {
                                      if (_isLoading) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: ShimmerSkeleton(
                                            width: 150,
                                          ),
                                        );
                                      } else {
                                        return Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: const EdgeInsets.only(right: 10),
                                          decoration:
                                              BoxDecoration(color: Colors.white),
                                          child: Image.network(
                                            package.image_url[index],
                                            fit: BoxFit.contain,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Text("Rp. ${package.price}")
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Text("Detail"),
                                Text(package.description),
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
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
