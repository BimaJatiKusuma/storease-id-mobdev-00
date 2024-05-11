import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget{
  const SplashPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: const Text('Selamat Datang di Storease'),
      ),
    );
  }
}