import 'package:customertech/apiservice/register_service.dart';
import 'package:customertech/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final isPasswordHidden = true.obs;
  final isLoading = false.obs;
  final ApiService _apiService = Get.find<ApiService>();

  /// Toggle password visibility
  void togglePasswordVisibility() => isPasswordHidden.toggle();

  /// Validate phone number
  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) return 'Please enter phone number';
    if (!RegExp(r'^\d{10,15}$').hasMatch(value)) return 'Invalid phone number';
    return null;
  }

  /// Validate password
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Please enter password';
    if (value.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  /// Handle login
 void handleLogin() async {
  if (formKey.currentState!.validate()) {
    final result = await ApiService().loginUser(
      mobileNumber: phoneController.text.trim(),
      password: passwordController.text.trim(),
    );

    if (result['success'] == true) {
      Get.offAllNamed('/main'); // Navigate to main screen
    } else {
      Get.snackbar('Login Failed', result['message']);
    }
  }
}

  @override
  void onClose() {
    phoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}