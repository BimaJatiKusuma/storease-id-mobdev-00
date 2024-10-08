// splash_page.dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:storease_mobileapp_dev/screen/auth/Login.dart';
import 'package:storease_mobileapp_dev/screen/home.dart';
import 'package:storease_mobileapp_dev/screen/onboarding/onboarding.dart';
import 'package:storease_mobileapp_dev/method/secure_storage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SecureStorage _secureStorage = SecureStorage();

  @override
  void initState() {
    super.initState();
    _startSplashTimer();
  }

  void _startSplashTimer() {
    Timer(const Duration(seconds: 1), () {
      _navigateBasedOnStatus();
    });
  }

  Future<void> _navigateBasedOnStatus() async {
    String? hasCompletedOnboarding = await _secureStorage
        .readSecureData(dotenv.env["KEY_SPLASH"] ?? 'onBoardingCompleted');
    if (hasCompletedOnboarding == 'true') {
      // Onboarding completed, check for token
      String? token = await _secureStorage
          .readSecureData(dotenv.env["KEY_TOKEN"] ?? 'token');
      if (token != null && token.isNotEmpty) {
        Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
        _secureStorage.writeSecureData(dotenv.env["KEY_USER_ID"]!, decodedToken["sub"]);
        // Token exists, navigate to HomePage
        if (JwtDecoder.isExpired(token)) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        }
        ;

        // // Token exists, navigate to HomePage
        // ApiServices apiServices = ApiServices();
        // apiServices.getTokenStatus().then((value){
        //   if (value){
        //     Navigator.pushReplacement(
        //       context,
        //       MaterialPageRoute(builder: (context) => Home()),
        //     );
        //   } else {
        //     Navigator.pushReplacement(
        //       context,
        //       MaterialPageRoute(builder: (context) => Login()),
        //     );
        //   }
        // });
      } else {
        // No token, navigate to LoginPage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      }
    } else {
      // Onboarding not completed, navigate to OnBoarding
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoarding()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(100, 113, 183, 0.86),
          Color.fromRGBO(255, 208, 214, 1)
        ])),
        alignment: Alignment.center,
        child: Image.asset("images/splash_logo.png"),
      ),
    );
  }
}
