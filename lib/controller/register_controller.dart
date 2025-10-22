import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  // 🔹 Text Editing Controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  // 🔹 Password visibility
  final isPasswordHidden = true.obs;
   var isLoading = false.obs;
  // 🔹 Form key
  final formKey = GlobalKey<FormState>();

  // 🔹 Registration action (you can connect to backend later)
  void registerUser() {
    if (formKey.currentState!.validate()) {
      Get.snackbar(
        "Success",
        "Registration successful!",
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        "Error",
        "Please fill all fields correctly",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
