import 'package:flutter/material.dart';

class WeddingEssentials extends StatefulWidget {
  const WeddingEssentials({super.key});

  @override
  State<WeddingEssentials> createState() => _WeddingEssentialsState();
}

class _WeddingEssentialsState extends State<WeddingEssentials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kelengkapan Pernikahan"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              child: Column(
                children: [
                  Image.asset("images/account_circle_blue.png"),
                  Text("Muhammad Amazon")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}