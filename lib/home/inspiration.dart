import 'package:flutter/material.dart';

class Inspiration extends StatefulWidget {
  Inspiration({super.key});

  @override
  State<StatefulWidget> createState() {
    return _InspirationState();
  }
}

class _InspirationState extends State<Inspiration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text("Inspiration")
            ],
          ),
        ),
      )),
    );
  }
}
