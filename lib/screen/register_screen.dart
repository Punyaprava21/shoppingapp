import 'package:customertech/controller/register_controller.dart';
import 'package:customertech/screen/main_screen.dart';
import 'package:customertech/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegisterController>();
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true, // ✅ allows layout to resize when keyboard opens
      backgroundColor: getBackgroundColor(isDark),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isTablet = constraints.maxWidth > 600;
            final padding = isTablet ? width * 0.1 : kDefaultPadding * 1.5;

            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: padding, vertical: 12),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const ClampingScrollPhysics(),
                          child: Column(
                            children: [
                              SizedBox(height: height * 0.04),

                              // 🟣 Top Icon
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [
                                      getPrimaryColor(isDark),
                                      getPrimaryColor(isDark).withOpacity(0.7),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: getPrimaryColor(isDark).withOpacity(0.3),
                                      blurRadius: 20,
                                      offset: const Offset(0, 6),
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.all(22),
                                child: const Icon(
                                  Icons.app_registration_rounded,
                                  size: 55,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: height * 0.03),

                              // 🟣 Title
                              Text(
                                "Create Account",
                                style: TextStyle(
                                  fontSize: isTablet ? 32 : 26,
                                  fontWeight: FontWeight.bold,
                                  color: getTextColor(isDark),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "Register to get started",
                                style: TextStyle(
                                  color: getSubtextColor(isDark),
                                  fontSize: isTablet ? 18 : 14,
                                ),
                              ),
                              SizedBox(height: height * 0.03),

                              // 🟣 Form Card
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(isTablet ? 32 : 20),
                                decoration: BoxDecoration(
                                  color: getCardColor(isDark),
                                  borderRadius: BorderRadius.circular(
                                    kCardBorderRadius * 1.5,
                                  ),
                                  border: Border.all(
                                    color: getSubtextColor(isDark).withOpacity(0.4),
                                    width: 1,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: isDark
                                          ? Colors.black.withOpacity(0.3)
                                          : Colors.black.withOpacity(0.1),
                                      blurRadius: 10,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Form(
                                  key: controller.formKey,
                                  child: Column(
                                    children: [
                                      _buildTextField(
                                        context,
                                        controller: controller.nameController,
                                        label: "Full Name",
                                        icon: Icons.person_outline_rounded,
                                        keyboardType: TextInputType.name,
                                      ),
                                      const SizedBox(height: 16),
                                      _buildTextField(
                                        context,
                                        controller: controller.emailController,
                                        label: "Email Address",
                                        icon: Icons.email_outlined,
                                        keyboardType: TextInputType.emailAddress,
                                      ),
                                      const SizedBox(height: 16),
                                      _buildTextField(
                                        context,
                                        controller: controller.phoneController,
                                        label: "Phone Number",
                                        icon: Icons.phone_iphone_rounded,
                                        keyboardType: TextInputType.phone,
                                      ),
                                      const SizedBox(height: 16),

                                      // 🟣 Password
                                      Obx(
                                        () => _buildTextField(
                                          context,
                                          controller:
                                              controller.passwordController,
                                          label: "Password",
                                          icon: Icons.lock_outline_rounded,
                                          obscureText: controller
                                              .isPasswordHidden.value,
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              controller.isPasswordHidden.value
                                                  ? Icons.visibility_off_rounded
                                                  : Icons.visibility_rounded,
                                              color: getPrimaryColor(isDark),
                                            ),
                                            onPressed: () => controller
                                                    .isPasswordHidden.value =
                                                !controller
                                                    .isPasswordHidden.value,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(height: 30),

                                      // 🟣 Register Button
                                      Obx(
                                        () => SizedBox(
                                          width: double.infinity,
                                          height: isTablet ? 55 : 48,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Get.to(() => const MainScreen());
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  getPrimaryColor(isDark),
                                              foregroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        kCardBorderRadius),
                                              ),
                                              elevation: 4,
                                            ),
                                            child: controller.isLoading.value
                                                ? const CircularProgressIndicator(
                                                    color: Colors.white,
                                                  )
                                                : Text(
                                                    "Register",
                                                    style: TextStyle(
                                                      fontSize:
                                                          isTablet ? 20 : 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: height * 0.05),
                            ],
                          ),
                        ),
                      ),

                      // 🟣 Login Link — stays at bottom safely
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(
                                color: getSubtextColor(isDark),
                                fontSize: isTablet ? 16 : 14,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Get.toNamed('/login'),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: getSecondaryColor(isDark, theme: ''),
                                  fontWeight: FontWeight.w600,
                                  fontSize: isTablet ? 17 : 15,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // 🔹 Reusable TextField Builder
  Widget _buildTextField(
    BuildContext context, {
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: TextStyle(color: getTextColor(isDark), fontSize: 15),
      validator: (value) {
        if (value == null || value.isEmpty) return "Please enter $label";
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: getSubtextColor(isDark)),
        prefixIcon: Icon(icon, color: getPrimaryColor(isDark), size: kIconSize),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: getBackgroundColor(isDark).withOpacity(0.8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kCardBorderRadius),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kCardBorderRadius),
          borderSide: BorderSide(color: getPrimaryColor(isDark), width: 1.5),
        ),
      ),
    );
  }
}
