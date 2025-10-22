import 'package:customertech/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppearanceScreen extends StatelessWidget {
  const AppearanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? kBackgroundDark : kBackgroundLight,
      appBar: AppBar(
        backgroundColor: isDark ? Colors.black : Colors.white,
        title: Text(
          'Appearance',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: isDark ? kTextDark : kTextLight,
            letterSpacing: 0.3,
          ),
        ),

        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: isDark ? kTextDark : kTextLight),
        leading: Semantics(
          label: 'Back to previous screen',
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: isDark ? kTextDark : kTextLight,
            ),
            onPressed: () => Get.back(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Choose Theme",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isDark ? kTextDark : kTextLight,
              ),
            ),
            const SizedBox(height: kDefaultPadding),
            Semantics(
              label: 'Dark mode toggle',
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Dark Mode",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: isDark ? kTextDark : kTextLight,
                      ),
                    ),
                    Switch(
                      value: isDark,
                      activeColor: isDark
                          ? kPrimaryColorDark
                          : kPrimaryColorLight,
                      onChanged: (value) {
                        Get.changeThemeMode(
                          value ? ThemeMode.dark : ThemeMode.light,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: kDefaultPadding * 1.5),
            Text(
              isDark
                  ? "Dark mode helps reduce eye strain and saves battery."
                  : "Light mode keeps things bright and clear.",
              style: TextStyle(
                fontSize: 13,
                color: isDark ? kSubtextDark : kSubtextLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
