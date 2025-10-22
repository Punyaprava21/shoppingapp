import 'package:customertech/utility/colors.dart';
import 'package:flutter/material.dart';

class TermsconditionScreen extends StatelessWidget {
  const TermsconditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? kBackgroundDark : kBackgroundLight,
      appBar: AppBar(
        backgroundColor: isDark ? const Color(0xFF1F1F1F) : Colors.white,
        title: Text(
          'Terms & Conditions',
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: getTextColor(isDark)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("1. Introduction", isDark),
            _buildSectionText(
              "Welcome to CustomerTech — a trusted platform connecting customers with certified technicians for repairing and servicing electrical appliances such as ACs, fans, refrigerators, washing machines, and more. By using our app, you agree to the following terms and conditions.",
              isDark,
            ),
            const SizedBox(height: 16),

            _buildSectionTitle("2. Service Booking", isDark),
            _buildSectionText(
              "• Customers can book electrical services directly through the app.\n"
              "• All bookings depend on technician availability in your area.\n"
              "• Accurate address and contact details must be provided for a smooth service experience.",
              isDark,
            ),
            const SizedBox(height: 16),

            _buildSectionTitle("3. Payments & Charges", isDark),
            _buildSectionText(
              "• Service charges will be shown before confirming the booking.\n"
              "• Additional charges may apply if extra parts or repairs are required.\n"
              "• Online and cash payments are supported as per app policy.",
              isDark,
            ),
            const SizedBox(height: 16),

            _buildSectionTitle("4. Technician Responsibilities", isDark),
            _buildSectionText(
              "• All technicians are verified professionals.\n"
              "• They are responsible for using safe repair practices and original parts.\n"
              "• Technicians must arrive on time or inform the customer in case of delay.",
              isDark,
            ),
            const SizedBox(height: 16),

            _buildSectionTitle("5. Customer Responsibilities", isDark),
            _buildSectionText(
              "• Customers must ensure the technician has access to the appliance safely.\n"
              "• Cancellations should be done before technician dispatch to avoid cancellation charges.\n"
              "• Any misconduct with technicians will result in account suspension.",
              isDark,
            ),
            const SizedBox(height: 16),

            _buildSectionTitle("6. Warranty & Liability", isDark),
            _buildSectionText(
              "• Services include a limited-time warranty, depending on the type of repair.\n"
              "• The company is not responsible for damage due to customer mishandling after service completion.\n"
              "• In case of disputes, the company decision will be final.",
              isDark,
            ),
            const SizedBox(height: 16),

            _buildSectionTitle("7. Privacy & Data", isDark),
            _buildSectionText(
              "• Customer data such as name, phone number, and address is collected only for service purposes.\n"
              "• We never share your data with third parties without consent.",
              isDark,
            ),
            const SizedBox(height: 16),

            _buildSectionTitle("8. Contact Us", isDark),
            _buildSectionText(
              "If you have any questions regarding these terms, please contact us at:\n"
              "support@customertech.com",
              isDark,
            ),
            const SizedBox(height: 32),

            Center(
              child: Text(
                "© 2025 CustomerTech. All rights reserved.",
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

  Widget _buildSectionTitle(String title, bool isDark) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: isDark ? kTextDark : kTextLight,
      ),
    );
  }

  Widget _buildSectionText(String text, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13.5,
          height: 1.5,
          color: isDark ? kSubtextDark : kSubtextLight,
        ),
      ),
    );
  }
}
