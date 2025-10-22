import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:customertech/app_pages.dart';

class HomeController extends GetxController {
  final currentPage = 0.obs;
  final pageController = PageController();

  @override
  void onInit() {
    super.onInit();
    // Auto-slide every 4 seconds
    Timer.periodic(const Duration(seconds: 4), (timer) {
      if (pageController.hasClients) {
        int nextPage = (currentPage.value + 1) % 3;
        pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
        currentPage.value = nextPage;
      }
    });
  }

  void navigateToServiceDetail() {
    Get.toNamed(AppPages.servicedetail);
  }
}
