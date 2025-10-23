import 'package:customertech/controller/login_controller.dart';
import 'package:customertech/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: isDark ? kBackgroundDark : kBackgroundLight,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isTablet = constraints.maxWidth > 600;
            final padding = isTablet ? width * 0.1 : kDefaultPadding * 1.5;

            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: padding, vertical: 24),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: height * 0.95),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: height * 0.05),

                      // 🔹 Logo
                      CircleAvatar(
                        radius: isTablet ? 60 : 45,
                        backgroundColor:
                            (isDark ? kPrimaryColorDark : kPrimaryColorLight)
                                .withOpacity(0.1),
                        child: Icon(
                          Icons.electrical_services_rounded,
                          size: isTablet ? 60 : 40,
                          color: isDark
                              ? kPrimaryColorDark
                              : kPrimaryColorLight,
                        ),
                      ),

                      SizedBox(height: height * 0.03),

                      // 🔹 Welcome Text
                      Text(
                        "Welcome Back 👋",
                        style: TextStyle(
                          fontSize: isTablet ? 34 : 26,
                          fontWeight: FontWeight.bold,
                          color: isDark ? kTextDark : kTextLight,
                        ),
                      ),
                      SizedBox(height: height * 0.008),
                      Text(
                        "Login to book your trusted technician",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: isDark ? kSubtextDark : kSubtextLight,
                          fontSize: isTablet ? 18 : 14,
                        ),
                      ),

                      SizedBox(height: height * 0.05),

                      // 🔹 Form Card
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(isTablet ? 32 : 20),
                        decoration: BoxDecoration(
                          color: isDark ? kCardDark : kCardLight,
                          borderRadius: BorderRadius.circular(
                            kCardBorderRadius * 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(
                                isDark ? 0.2 : 0.07,
                              ),
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
                                controller: controller.phoneController,
                                label: "Phone Number",
                                icon: Icons.phone_iphone_rounded,
                                keyboardType: TextInputType.phone,
                                validator: controller.validatePhone,
                              ),
                              SizedBox(height: height * 0.02),

                              Obx(
                                () => _buildTextField(
                                  context,
                                  controller: controller.passwordController,
                                  label: "Password",
                                  icon: Icons.lock_outline_rounded,
                                  obscureText:
                                      controller.isPasswordHidden.value,
                                  validator: controller.validatePassword,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      controller.isPasswordHidden.value
                                          ? Icons.visibility_off_rounded
                                          : Icons.visibility_rounded,
                                      color: isDark
                                          ? kPrimaryColorDark
                                          : kPrimaryColorLight,
                                    ),
                                    onPressed:
                                        controller.togglePasswordVisibility,
                                  ),
                                ),
                              ),

                              SizedBox(height: height * 0.03),

                              // 🔹 Login Button
                              SizedBox(
                                width: double.infinity,
                                height: isTablet ? 55 : 48,
                                child: ElevatedButton(
                                  onPressed: controller.handleLogin,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isDark
                                        ? kPrimaryColorDark
                                        : kPrimaryColorLight,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        kCardBorderRadius,
                                      ),
                                    ),
                                    elevation: 3,
                                    shadowColor:
                                        (isDark
                                                ? kPrimaryColorDark
                                                : kPrimaryColorLight)
                                            .withOpacity(0.3),
                                  ),
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: isTablet ? 20 : 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: height * 0.05),

                      // 🔹 Register Text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t have an account? ",
                            style: TextStyle(
                              color: isDark ? kSubtextDark : kSubtextLight,
                              fontSize: isTablet ? 16 : 14,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Get.toNamed('/register'),
                            child: Text(
                              "Register",
                              style: TextStyle(
                                color: isDark
                                    ? kSecondaryColorDark
                                    : kSecondaryColorLight,
                                fontWeight: FontWeight.w600,
                                fontSize: isTablet ? 17 : 15,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: height * 0.05),
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

  // 🔹 Common TextField
  Widget _buildTextField(
    BuildContext context, {
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    bool obscureText = false,
    String? Function(String?)? validator,
    Widget? suffixIcon,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      style: TextStyle(color: isDark ? kTextDark : kTextLight, fontSize: 15),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: isDark ? kSubtextDark : kSubtextLight),
        prefixIcon: Icon(
          icon,
          color: isDark ? kPrimaryColorDark : kPrimaryColorLight,
          size: kIconSize,
        ),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: isDark
            ? kBackgroundDark.withOpacity(0.4)
            : kBackgroundLight.withOpacity(0.9),
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
      ),
    );
  }
}
