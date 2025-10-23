import 'package:customertech/app_pages.dart';
import 'package:customertech/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const CustomerTechApp());
}

class CustomerTechApp extends StatelessWidget {
  const CustomerTechApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CustomerTech Services",
      themeMode: ThemeMode.system,
      initialRoute: AppPages.splash,
      getPages: AppPages.pages,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: kBackgroundLight,
        primaryColor: kPrimaryColorLight,
        cardColor: kCardLight,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: kTextLight),
          bodyMedium: TextStyle(color: kSubtextLight),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: kPrimaryColorLight,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: kSecondaryColorLight,
          foregroundColor: Colors.white,
        ),
        colorScheme: const ColorScheme.light(
          primary: kPrimaryColorLight,
          secondary: kSecondaryColorLight,
          surface: kCardLight,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: kBackgroundDark,
        primaryColor: kPrimaryColorDark,
        cardColor: kCardDark,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: kTextDark),
          bodyMedium: TextStyle(color: kSubtextDark),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: kPrimaryColorDark,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: kSecondaryColorDark,
          foregroundColor: Colors.white,
        ),
        colorScheme: const ColorScheme.dark(
          primary: kPrimaryColorDark,
          secondary: kSecondaryColorDark,
          surface: kCardDark,
        ),
      ),
    );
  }
}
