import 'package:customertech/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    final nameController = TextEditingController(text: "John Doe");
    final phoneController = TextEditingController(text: "+91 9876543210");
    final emailController = TextEditingController(text: "johndoe@email.com");
    final addressController = TextEditingController(text: "Bhubaneswar, Odisha");

    return Scaffold(
      backgroundColor: isDark ? kBackgroundDark : kBackgroundLight,
      appBar: AppBar(
      backgroundColor: isDark ? const Color(0xFF1F1F1F) : Colors.white,
        title: Text(
          "Edit Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: isDark ? kTextDark : kTextLight,
            letterSpacing: 0.3,
          ),
        ),
        iconTheme: IconThemeData(color: isDark ? kTextDark : kTextLight),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Profile image
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 48,
                    backgroundColor: isDark ? kCardDark : kCardLight,
                    child: const Icon(Icons.person, size: 48, color: Colors.grey),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        color: isDark ? kPrimaryColorDark : kPrimaryColorLight,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(6),
                      child: Icon(
                        Icons.edit,
                        size: 16,
                        color: isDark ? kTextDark : kTextDark ,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Input fields
            _buildTextField(
              controller: nameController,
              label: "Full Name",
              icon: Icons.person_outline,
              isDark: isDark,
            ),
            const SizedBox(height: 16),

            _buildTextField(
              controller: phoneController,
              label: "Phone Number",
              icon: Icons.phone_android_outlined,
              keyboardType: TextInputType.phone,
              isDark: isDark,
            ),
            const SizedBox(height: 16),

            _buildTextField(
              controller: emailController,
              label: "Email",
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              isDark: isDark,
            ),
            const SizedBox(height: 16),

            _buildTextField(
              controller: addressController,
              label: "Address",
              icon: Icons.location_on_outlined,
              isDark: isDark,
            ),

            const SizedBox(height: 40),

            // Save button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.back(); // After saving, go back
                  Get.snackbar(
                    "Profile Updated",
                    "Your changes have been saved successfully.",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor:
                        isDark ? kPrimaryColorDark : kPrimaryColorLight,
                    colorText: isDark ? kTextDark : kTextLight,
                    margin: const EdgeInsets.all(16),
                    borderRadius: 12,
                    duration: const Duration(seconds: 2),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isDark ? kPrimaryColorDark : kPrimaryColorLight,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                child: Text(
                  "Save Changes",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isDark ? kTextDark : kTextDark,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required bool isDark,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: TextStyle(
        color: isDark ? kTextDark : kTextLight,
        fontSize: 14.5,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(icon,
            color: isDark ? kPrimaryColorDark : kPrimaryColorLight, size: 20),
        labelText: label,
        labelStyle: TextStyle(
          color: isDark ? kSubtextDark : kSubtextLight,
          fontSize: 13.5,
        ),
        filled: true,
        fillColor: isDark ? kCardDark : kCardLight,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDark
                ? kSubtextDark.withOpacity(0.4)
                : kSubtextLight.withOpacity(0.4),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color:
                isDark ? kPrimaryColorDark : kPrimaryColorLight,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
