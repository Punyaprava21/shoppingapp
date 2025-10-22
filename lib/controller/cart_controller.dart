import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  // Reactive variables
  var itemCounts = <int, int>{}.obs; // itemId → count
  var totalPrice = 0.obs; // Total price of items in cart
  var serviceName = ''.obs; // Selected service name
  var phoneNumber = ''.obs; // User phone number
  var paymentSummary = <Map<String, String>>[].obs; // Payment summary items
  var quantity = 1.obs; // Quantity of main service
  var total = ''.obs; // Formatted total price for display

  @override
  void onInit() {
    super.onInit();
    // Update total whenever paymentSummary or itemCounts changes
    ever(paymentSummary, (_) => _updateTotal());
    ever(itemCounts, (_) => _updateTotal());
  }

  // Increment item count and update price
  void incrementItem(int id, int price) {
    itemCounts[id] = (itemCounts[id] ?? 0) + 1;
    totalPrice.value += price;
    _updatePaymentSummary();
  }

  // Decrement item count and update price
  void decrementItem(int id, int price) {
    if ((itemCounts[id] ?? 0) > 0) {
      itemCounts[id] = itemCounts[id]! - 1;
      totalPrice.value -= price;
      if (itemCounts[id] == 0) {
        itemCounts.remove(id); // Remove item if count is 0
      }
      _updatePaymentSummary();
    }
  }

  // Update payment summary based on item counts
  void _updatePaymentSummary() {
    if (itemCounts.isNotEmpty) {
      paymentSummary.clear();
      paymentSummary.add({
        'label': serviceName.value,
        'value': '₹${totalPrice.value}',
      });
    } else {
      paymentSummary.clear();
    }
    _updateTotal();
  }

  // Update total price for display
  void _updateTotal() {
    if (paymentSummary.isNotEmpty) {
      total.value = '₹${totalPrice.value}';
    } else {
      total.value = '₹0';
    }
  }

  // Handle address and slot selection (placeholder for navigation or action)
  void addAddressAndSlot() {
    if (phoneNumber.value.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter a valid phone number',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    // Placeholder for navigation to address/slot selection screen
    Get.snackbar(
      'Success',
      'Proceeding to add address and slot for ${serviceName.value}',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }
}