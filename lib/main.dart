import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // new comment test git
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: 'Poppins',
          appBarTheme:
              AppBarTheme(
                scrolledUnderElevation: 0,
                backgroundColor: Color.fromRGBO(207, 225, 255, 1)),
          scaffoldBackgroundColor: const Color.fromARGB(255, 240, 244, 252)),
      home: const SplashPage(),
    );
  }
}
