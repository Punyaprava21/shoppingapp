import 'package:customertech/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class BookingsController extends GetxController {
  final activeBookings = <Map<String, dynamic>>[].obs;
  final completedBookings = <Map<String, dynamic>>[].obs;
  final cancelledBookings = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBookings();
  }

  Future<void> fetchBookings() async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    activeBookings.assignAll([
      {
        'bookingId': '#BK123456',
        'serviceName': 'Electrical Repair',
        'technicianName': 'Rajesh Kumar',
        'date': 'Today, 9AM - 12PM',
        'status': 'Technician On The Way',
        'statusColor': Get.isDarkMode ? kAccentColorDark : kAccentColorLight,
        'icon': Icons.electrical_services,
        'amount': '₹471',
      },
      {
        'bookingId': '#BK123455',
        'serviceName': 'AC Repair',
        'technicianName': 'Amit Sharma',
        'date': 'Tomorrow, 2PM - 4PM',
        'status': 'Pending',
        'statusColor': Get.isDarkMode ? kPrimaryColorDark : kPrimaryColorLight,
        'icon': Icons.ac_unit,
        'amount': '₹599',
      },
    ]);
    completedBookings.assignAll([
      {
        'bookingId': '#BK123450',
        'serviceName': 'Plumbing',
        'technicianName': 'Suresh Patel',
        'date': 'Yesterday, 10AM',
        'status': 'Completed',
        'statusColor': Get.isDarkMode ? kSecondaryColorDark : kSecondaryColorLight,
        'icon': Icons.plumbing,
        'amount': '₹399',
      },
    ]);
    cancelledBookings.assignAll([]);
  }
}