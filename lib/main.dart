import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/internet/dependency_injection.dart';
import 'package:storease_mobileapp_dev/splash.dart';

void main() async {
    await dotenv.load(fileName: ".env", mergeWith: {
    'TEST_VAR': '5',
  }); // mergeWith optional, you can include Platform.environment for Mobile/Desktop app

  runApp(const MyApp());
  DependencyInjection.init();
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // new comment test git
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Storease',
      theme: ThemeData(
          fontFamily: 'Poppins',
          dividerTheme: DividerThemeData(
            color: MyColor.color1
          ),
          appBarTheme:
              AppBarTheme(
                scrolledUnderElevation: 0,
                foregroundColor: Colors.white,
                titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                backgroundColor: MyColor.color1),
          scaffoldBackgroundColor: const Color.fromARGB(255, 240, 244, 252)),
      home: SplashPage(),
    );
  }

}
