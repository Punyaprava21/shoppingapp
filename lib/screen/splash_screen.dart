import 'package:customertech/controller/splash_controller.dart';
import 'package:customertech/screen/pulsingdots_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final SplashScreenController _controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    _controller.navigateAfterDelay(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App logo
            Image.asset(
              'assets/logo.png', // replace with your actual logo path
              height: 120,
              width: 120,
            ),
            const SizedBox(height: 20),
            const Text(
              "Customer Book",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 40),
            const PulsingDots(),
          ],
        ),
      ),
    );
  }
}
