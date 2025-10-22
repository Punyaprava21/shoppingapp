import 'dart:async';
import 'package:customertech/controller/splash_controller.dart';
import 'package:customertech/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashController controller = Get.put(SplashController());

    // Start timer as soon as widget builds
    Timer(const Duration(seconds: 3), () {
     Get.to(()=> LoginScreen());
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🔹 App Logo
            Image.asset(
              'assets/images/logo.png', // change to your logo path
              height: 120,
            ),
            const SizedBox(height: 20),

            // 🔹 App Title
            const Text(
              'Customer Booking App',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 16),

            // 🔹 Loading Indicator
            const CircularProgressIndicator(
              color: Colors.amber,
              strokeWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}
