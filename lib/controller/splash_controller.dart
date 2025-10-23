import 'dart:async';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:customertech/screen/login_screen.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateAfterDelay();
  }

  void _navigateAfterDelay() {
    Timer(const Duration(seconds: 3), () {
      Get.offAll(() => const LoginScreen()); 
    });
  }

  void navigateAfterDelay(BuildContext context) {}
}
