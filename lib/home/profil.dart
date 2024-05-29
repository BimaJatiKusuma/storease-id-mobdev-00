import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  Profil({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfilState();
  }
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text("Profil")
            ],
          ),
        ),
      )),
    );
  }
}
