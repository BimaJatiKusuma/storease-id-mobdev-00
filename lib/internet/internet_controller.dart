import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InternetController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  // void _updateConnectionStatus(ConnectivityResult connectivityResult){
  //   if(connectivityResult == ConnectivityResult.none){
  //     Get.rawSnackbar(
  //       messageText: Text("No Internet Connection")
  //     );
  //   }
  // }

  void _updateConnectionStatus(List<ConnectivityResult> connectivityResult) {
    if (connectivityResult.contains(ConnectivityResult.none)) {
      Get.rawSnackbar(
        margin: EdgeInsets.only(bottom: 60),
        messageText: Text('Tidak terhubung ke Internet'),
        isDismissible: true,
        duration: Duration(days: 1),
        mainButton: TextButton(
          onPressed: () {
            Get.closeCurrentSnackbar(); // Close the snackbar manually
          },
          child: Text(
            'Close',
            style: TextStyle(color: Colors.white), // Customize the button text
          ),
        ),
      );
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}
