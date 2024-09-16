import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/screen/home/homepage.dart';
import 'package:storease_mobileapp_dev/screen/home/inspiration.dart';
import 'package:storease_mobileapp_dev/screen/home/profil.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;

  final tabs = [
    HomePage(),
    Inspiration(),
    Profil()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
            backgroundColor: Colors.blue),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: "Inspirasi",
            backgroundColor: Colors.blue),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "Profil",
            backgroundColor: Colors.blue),
      ],
      onTap: (index){
        setState(() {
          _currentIndex = index;
        });
      },
    ));
  }
}
