import 'package:get/get.dart';
import 'package:storease_mobileapp_dev/internet/internet_controller.dart';

class DependencyInjection {
  static void init(){
    Get.put<InternetController>(InternetController(), permanent: true);
  }
}