import 'package:customertech/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutusScreen extends StatelessWidget {
  const AboutusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? kBackgroundDark : kBackgroundLight,
      appBar: AppBar(
        title: Text(
          "About Us",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: isDark ? const Color(0xFF1F1F1F) : Colors.white,
        elevation: 0,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black),
        leading: Semantics(
          label: 'Back to previous screen',
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: isDark ? Colors.white : Colors.black,
            ),
            onPressed: () => Get.back(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Semantics(
          label: 'About us information',
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
            child: Text(
              "Welcome to our app! \n\n"
              "We are committed to providing the best services to our customers. "
              "Our platform allows you to book services easily and track them efficiently. "
              "Our mission is to ensure customer satisfaction and a seamless experience.\n\n"
              "Thank you for choosing us!",
              style: TextStyle(
                fontSize: 14,
                color: isDark ? kTextDark : kTextLight,
                height: 1.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
