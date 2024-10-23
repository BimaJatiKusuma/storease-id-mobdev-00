import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/screen/homepage/homepage.dart';
import 'package:storease_mobileapp_dev/screen/inspiration/inspiration.dart';
import 'package:storease_mobileapp_dev/screen/profile/profil.dart';

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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 241, 246, 255),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), // Shadow color
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, -3), // Shadow position (upwards)
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 241, 246, 255),
          currentIndex: _currentIndex,
          selectedItemColor: MyColor.color1,
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          items: [
            _buildBottomNavigationBarItem(
              index: 0,
              icon: Icons.home_outlined,
              activeIcon: Icons.home,
              label: "Beranda",
            ),
            _buildBottomNavigationBarItem(
              index: 1,
              icon: Icons.favorite_outline,
              activeIcon: Icons.favorite,
              label: "Inspirasi",
            ),
            _buildBottomNavigationBarItem(
              index: 2,
              icon: Icons.account_circle_outlined,
              activeIcon: Icons.account_circle,
              label: "Profil",
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required int index,
    required IconData icon,
    required IconData activeIcon,
    required String label,
  }) {
    bool isSelected = _currentIndex == index;

    return BottomNavigationBarItem(
      icon: Column(
        children: [
          // Conditionally add a line above the icon if selected
          // isSelected
          //     ? Container(
          //         height: 3,
          //         width: 40,
          //         color: MyColor.color1, // Line color
          //       )
          //     : const SizedBox(height: 3), // Empty space if not selected
          Icon(isSelected ? activeIcon : icon),
          isSelected
              ? Container(
                  height: 3,
                  width: 40,
                  color: MyColor.color1, // Line color
                )
              : const SizedBox(height: 3), // Empty space if not selected
        ],
      ),
      label: label,
    );
  }
}
