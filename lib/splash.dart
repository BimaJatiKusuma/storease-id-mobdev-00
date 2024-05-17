import 'dart:async';

import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/auth/Auth.dart';

class SplashPage extends StatefulWidget{
  const SplashPage({Key? key}) : super(key: key);


  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Container(
  //       alignment: Alignment.center,
  //       child: const Text('Selamat Datang di Storease\nAyo wujudkan mimpimu'),
  //     ),
  //   );
  // }
  
  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return Auth();
      }));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: const Text('Selamat Datang di Storease\nAyo wujudkan mimpimu'),
      ),
    );
  }
}