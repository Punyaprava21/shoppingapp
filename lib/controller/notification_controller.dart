import 'package:customertech/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class NotificationController extends GetxController {
  var notifications = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Sample data; replace with API call or local storage
    notifications.assignAll([
      {
        "icon": Icons.local_offer,
        "iconColor": Get.isDarkMode ? kAccentColorDark : kAccentColorLight,
        "title": "Offer Alert",
        "message": "Get 20% off on your next service",
        "time": "5 min ago",
        "isRead": false,
      },
      {
        "icon": Icons.payment,
        "iconColor": Get.isDarkMode ? kSecondaryColorDark : kSecondaryColorLight,
        "title": "Payment Received",
        "message": "Your payment of \$500 was successful",
        "time": "1 hour ago",
        "isRead": true,
      },
    ]);
  }

  void markAsRead(int index) {
    notifications[index]['isRead'] = true;
    notifications.refresh();
  }
}