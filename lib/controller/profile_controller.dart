import 'package:customertech/screen/chnage-password_screen.dart';
import 'package:customertech/screen/privacypolicy-screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:customertech/screen/termscondition_screen.dart';
import 'package:customertech/screen/aboutus_screen.dart';
import 'package:customertech/screen/notification_screen.dart';

class ProfileController extends GetxController {
  var userName = 'John Doe'.obs;
  var phoneNumber = '+91 98765 43210'.obs;

  final List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.password, 'title': 'Change Password', 'route': 'password'},
    {
      'icon': Icons.notifications,
      'title': 'Notifications',
      'route': 'notifications',
    },
    {'icon': Icons.privacy_tip, 'title': 'Privacy Policy', 'route': 'privacy'},
    {
      'icon': Icons.description,
      'title': 'Terms & Conditions',
      'route': 'terms',
    },
    {'icon': Icons.info, 'title': 'About Us', 'route': 'about'},
  ];

  // ✅ Navigation Logic Centralized Here
  void goToPage(String route) {
    switch (route) {
      case 'password':
        Get.to(() => const ChangePasswordScreen());
        break;
      case 'notifications':
        Get.to(() => const NotificationScreen());
        break;
      case 'privacy':
        Get.to(() => const PrivacyPolicyScreen());
        break;
      case 'terms':
        Get.to(() => const TermsconditionScreen());
        break;
      case 'about':
        Get.to(() => const AboutusScreen());
        break;
      default:
        Get.snackbar('Error', 'Page not found');
    }
  }

  void referNow() {
    Get.snackbar(
      'Refer & Earn',
      'Share your referral code with friends!',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void logout() {
    Get.defaultDialog(
      title: 'Logout',
      middleText: 'Are you sure you want to logout?',
      textConfirm: 'Yes',
      textCancel: 'No',
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.back();
        Get.snackbar('Logged Out', 'You have been logged out successfully');
      },
    );
  }
}
