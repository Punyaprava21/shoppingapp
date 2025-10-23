import 'package:customertech/screen/appearance-screen.dart';
import 'package:customertech/screen/booking_screen.dart';
import 'package:customertech/screen/edit_profile_screen.dart';
import 'package:customertech/screen/login_screen.dart';
import 'package:customertech/screen/support_screen.dart';
import 'package:customertech/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? kBackgroundDark : kBackgroundLight,
      appBar: AppBar(
        backgroundColor: isDark ? const Color(0xFF1F1F1F) : Colors.white,
        title: Text(
          "Profiles",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: isDark ? Colors.white : Colors.black,
            letterSpacing: 0.3,
          ),
        ),

        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: isDark ? Colors.white : Colors.black),
            onPressed: () {
              Get.to(() => EditProfileScreen());
              // Handle edit profile
            },
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isDark ? kCardDark : kCardLight,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: isDark
                        ? Colors.black.withOpacity(0.3)
                        : Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          isDark ? kPrimaryColorDark : kPrimaryColorLight,
                          isDark
                              ? kPrimaryColorDark.withOpacity(0.7)
                              : kPrimaryColorLight.withOpacity(0.7),
                        ],
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person,
                      color: isDark ? kTextDark : kTextDark,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Text(
                            controller.userName.value,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: isDark ? kTextDark : kTextLight,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Obx(
                          () => Text(
                            controller.phoneNumber.value,
                            style: TextStyle(
                              fontSize: 12,
                              color: isDark ? kSubtextDark : kSubtextLight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildActionButton(
                  icon: Icons.event_note,
                  label: "My bookings",
                  backgroundColor: isDark
                      ? kAccentColorDark
                      : kAccentColorLight,
                  isDark: isDark,
                  onTap: () {
                    Get.to(() => const BookingsScreen());
                  },
                ),
                _buildActionButton(
                  icon: Icons.color_lens_outlined,
                  label: "Appearance",
                  backgroundColor: isDark
                      ? kPrimaryColorDark
                      : kPrimaryColorLight,
                  isDark: isDark,
                  onTap: () {
                    Get.to(() => AppearanceScreen());
                  },
                ),
                _buildActionButton(
                  icon: Icons.help,
                  label: "Help & support",
                  backgroundColor: isDark
                      ? kSecondaryColorDark
                      : kSecondaryColorLight,
                  isDark: isDark,
                  onTap: () {
                    Get.to(() => const SupportScreen());
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                color: isDark ? kCardDark : kCardLight,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: isDark
                        ? Colors.black.withOpacity(0.3)
                        : Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.menuItems.length,
                separatorBuilder: (_, __) => Divider(
                  height: 1,
                  color: isDark
                      ? kSubtextDark.withOpacity(0.3)
                      : kSubtextLight.withOpacity(0.3),
                ),
                itemBuilder: (context, index) {
                  final item = controller.menuItems[index];
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: (isDark ? kPrimaryColorDark : kPrimaryColorLight)
                            .withOpacity(0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        item["icon"],
                        size: 18,
                        color: isDark ? kPrimaryColorDark : kPrimaryColorLight,
                      ),
                    ),
                    title: Text(
                      item["title"],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: isDark ? kTextDark : kTextLight,
                      ),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: isDark ? kSubtextDark : kSubtextLight,
                    ),
                    onTap: () {
                      controller.goToPage(item["route"]);
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 44),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Get.to(() => const LoginScreen());
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  side: BorderSide(
                    color: isDark
                        ? const Color(0xFFF87171)
                        : const Color(0xFFEF4444),
                    width: 1.5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isDark
                        ? const Color(0xFFF87171)
                        : const Color(0xFFEF4444),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Text(
                "Version 7.6.22 R517",
                style: TextStyle(
                  fontSize: 12,
                  color: isDark ? kSubtextDark : kSubtextLight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color backgroundColor,
    required bool isDark,
    required VoidCallback onTap,
  }) {
    return Semantics(
      label: 'Action: $label',
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 105,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          decoration: BoxDecoration(
            color: backgroundColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: backgroundColor.withOpacity(0.4),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: backgroundColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, size: 20, color: backgroundColor),
              ),
              const SizedBox(height: 10),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isDark ? kTextDark : kTextLight,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
