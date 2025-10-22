import 'package:customertech/controller/chnagepassword_controller.dart';
import 'package:customertech/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangePasswordController());
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? kBackgroundDark : kBackgroundLight,
      appBar: AppBar(
        title: Text(
          "Change Password",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          color: isDark ? Colors.white : Colors.black,
          ),
        ),
       backgroundColor: isDark ? const Color(0xFF1F1F1F) : Colors.white,
        elevation: 0,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(  color: isDark ? Colors.white : Colors.black,),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Container(
          padding: const EdgeInsets.all(kDefaultPadding),
          decoration: BoxDecoration(
            color: isDark ? kCardDark : kCardLight,
            borderRadius: BorderRadius.circular(kCardBorderRadius),
            border: Border.all(
              color: isDark ? kSubtextDark.withOpacity(0.5) : kSubtextLight.withOpacity(0.5),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: isDark ? Colors.black.withOpacity(0.3) : Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                Obx(
                  () => _buildPasswordField(
                    label: "Current Password",
                    controller: controller.currentController,
                    obscureText: !controller.showCurrent.value,
                    toggle: controller.toggleCurrent,
                    isDark: isDark,
                    validator: (value) => controller.validatePassword(value, "Current Password"),
                  ),
                ),
                const SizedBox(height: 12),
                Obx(
                  () => _buildPasswordField(
                    label: "New Password",
                    controller: controller.newController,
                    obscureText: !controller.showNew.value,
                    toggle: controller.toggleNew,
                    isDark: isDark,
                    validator: (value) => controller.validatePassword(value, "New Password"),
                  ),
                ),
                const SizedBox(height: 12),
                Obx(
                  () => _buildPasswordField(
                    label: "Confirm Password",
                    controller: controller.confirmController,
                    obscureText: !controller.showConfirm.value,
                    toggle: controller.toggleConfirm,
                    isDark: isDark,
                    validator: (value) => controller.validatePassword(value, "Confirm Password"),
                  ),
                ),
                const SizedBox(height: 24),
                Obx(
                  () => Semantics(
                    label: 'Save new password',
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: controller.isLoading.value ? null : controller.changePassword,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          backgroundColor: isDark ? kPrimaryColorDark : kPrimaryColorLight,
                          foregroundColor: isDark ? kTextDark : kTextLight,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(kCardBorderRadius),
                          ),
                          elevation: 2,
                        ),
                        child: controller.isLoading.value
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text(
                                "Save",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required String label,
    required TextEditingController controller,
    required bool obscureText,
    required VoidCallback toggle,
    required bool isDark,
    String? Function(String?)? validator,
  }) {
    return Semantics(
      label: 'Input field for $label',
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(color: isDark ? kTextDark : kTextLight, fontSize: 15),
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: isDark ? kSubtextDark : kSubtextLight, fontSize: 14),
          filled: true,
          fillColor: isDark ? kBackgroundDark.withOpacity(0.4) : kBackgroundLight.withOpacity(0.9),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kCardBorderRadius),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kCardBorderRadius),
            borderSide: BorderSide(
              color: isDark ? kPrimaryColorDark : kPrimaryColorLight,
              width: 1.6,
            ),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: isDark ? kPrimaryColorDark : kPrimaryColorLight,
            ),
            onPressed: toggle,
          ),
        ),
      ),
    );
  }
}