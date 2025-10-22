import 'package:customertech/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final currentController = TextEditingController();
  final newController = TextEditingController();
  final confirmController = TextEditingController();
  var showCurrent = false.obs;
  var showNew = false.obs;
  var showConfirm = false.obs;
  var isLoading = false.obs;

  void toggleCurrent() => showCurrent.value = !showCurrent.value;
  void toggleNew() => showNew.value = !showNew.value;
  void toggleConfirm() => showConfirm.value = !showConfirm.value;

  String? validatePassword(String? value, String field) {
    if (value == null || value.isEmpty) return "Please enter $field";
    if (value.length < 8) return "$field must be at least 8 characters";
    return null;
  }

  Future<void> changePassword() async {
    if (!formKey.currentState!.validate()) return;
    if (newController.text != confirmController.text) {
      Get.snackbar('Error', 'New password and confirm password do not match',
          backgroundColor: Get.isDarkMode ? kCardDark : kCardLight,
          colorText: Get.isDarkMode ? kTextDark : kTextLight);
      return;
    }
    isLoading.value = true;
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    Get.snackbar('Success', 'Password changed successfully',
        backgroundColor: Get.isDarkMode ? kCardDark : kCardLight,
        colorText: Get.isDarkMode ? kTextDark : kTextLight);
    Get.back();
  }

  @override
  void onClose() {
    currentController.dispose();
    newController.dispose();
    confirmController.dispose();
    super.onClose();
  }
}