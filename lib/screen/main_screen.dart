import 'package:customertech/screen/booking_screen.dart';
import 'package:flutter/material.dart';
import 'package:customertech/widget/bottom_nav.dart';
import 'package:customertech/screen/home_screen.dart';
import 'package:customertech/screen/profile_screen.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userName = Get.arguments?['name'] ?? 'User'; // get name from login
    int _currentIndex = 0;

    final List<Widget> _screens = [
      HomeScreen(userName: userName), // pass username to HomeScreen
      const BookingsScreen(),
      const ProfileScreen(),
    ];

    return StatefulBuilder(
      builder: (context, setState) => Scaffold(
        body: IndexedStack(index: _currentIndex, children: _screens),
        bottomNavigationBar: AppBottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
