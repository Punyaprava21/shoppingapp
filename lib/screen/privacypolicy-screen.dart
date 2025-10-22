import 'package:customertech/screen/support_screen.dart';
import 'package:customertech/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? kBackgroundDark : kBackgroundLight,
      appBar: AppBar(
        title: Text(
          "Privacy Policy",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
       backgroundColor: isDark ? const Color(0xFF1F1F1F) : Colors.white,
        elevation: 0,
        automaticallyImplyLeading: true,
         iconTheme: IconThemeData(color: getTextColor(isDark)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Container(
          padding: const EdgeInsets.all(kDefaultPadding),
          decoration: BoxDecoration(
            color: isDark ? kCardDark : kCardLight,
            borderRadius: BorderRadius.circular(kCardBorderRadius),
            border: Border.all(
              color: isDark
                  ? kSubtextDark.withOpacity(0.5)
                  : kSubtextLight.withOpacity(0.5),
              width: 1,
            ),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Semantics(
                label: 'Privacy Policy Introduction',
                child: Text(
                  "Introduction",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDark ? kTextDark : kTextLight,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Semantics(
                label: 'Introduction content',

                child: Text(
                  "We value your privacy and are committed to protecting your personal information. This Privacy Policy outlines how we collect, use, and safeguard your data when you use our app.",
                  style: TextStyle(
                    fontSize: 14,
                    color: isDark ? kSubtextDark : kSubtextLight,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Semantics(
                label: 'Data Collection heading',
                child: Text(
                  "Data Collection",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDark ? kTextDark : kTextLight,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Semantics(
                label: 'Data Collection content',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBulletPoint(
                      isDark,
                      "Personal Information: Name, email, and phone number provided during registration.",
                    ),
                    _buildBulletPoint(
                      isDark,
                      "Usage Data: Information about how you interact with our app, such as services booked.",
                    ),
                    _buildBulletPoint(
                      isDark,
                      "Device Information: Device type, operating system, and IP address for analytics purposes.",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Semantics(
                label: 'Data Usage heading',
                child: Text(
                  "Data Usage",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDark ? kTextDark : kTextLight,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Semantics(
                label: 'Data Usage content',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBulletPoint(
                      isDark,
                      "Service Delivery: To process bookings and provide customer support.",
                    ),
                    _buildBulletPoint(
                      isDark,
                      "Improvement: To analyze app usage and enhance user experience.",
                    ),
                    _buildBulletPoint(
                      isDark,
                      "Communication: To send service updates and promotional offers (with your consent).",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Semantics(
                label: 'Contact Us heading',
                child: Text(
                  "Contact Us",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDark ? kTextDark : kTextLight,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Semantics(
                label: 'Contact Us content',
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 13,
                      color: isDark ? kSubtextDark : kSubtextLight,
                      height: 1.5,
                    ),
                    children: [
                      const TextSpan(
                        text: "For more details or inquiries, please ",
                      ),
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () => Get.to(() => const SupportScreen()),
                          child: Text(
                            "contact our support team",
                            style: TextStyle(
                              color: isDark
                                  ? kSecondaryColorDark
                                  : kSecondaryColorLight,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      const TextSpan(text: "."),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBulletPoint(bool isDark, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "• ",
            style: TextStyle(
              fontSize: 13,
              color: isDark ? kSubtextDark : kSubtextLight,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13,
                color: isDark ? kSubtextDark : kSubtextLight,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
