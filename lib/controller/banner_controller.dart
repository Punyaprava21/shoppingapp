import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class BannerController extends GetxController {
  final currentPage = 0.0.obs;
  Timer? _timer;
  final PageController pageController = PageController(viewportFraction: 0.92);

  @override
  void onInit() {
    super.onInit();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (currentPage.value < 1) {
        currentPage.value = 1.0;
      } else {
        currentPage.value = 0.0;
      }
      pageController.animateToPage(
        currentPage.value.toInt(),
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  void updatePage(int page) {
    currentPage.value = page.toDouble();
  }

  @override
  void onClose() {
    _timer?.cancel();
    pageController.dispose();
    super.onClose();
  }
}