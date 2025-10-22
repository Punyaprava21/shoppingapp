import 'package:flutter/material.dart';


const Color kPrimaryColorLight = Color(0xFF7C3AED); // Deep Purple
const Color kPrimaryColorDark = Color(0xFFA78BFA); // Light Purple

const Color kSecondaryColorLight = Color(0xFFEF4444); // Coral Red
const Color kSecondaryColorDark = Color(0xFFFCA5A5); // Light Coral

const Color kAccentColorLight = Color(0xFFFCD34D); // Golden Yellow
const Color kAccentColorDark = Color(0xFFFDE047); // Bright Yellow


const Color kTextLight = Color(0xFF0F172A); // Dark text for light mode
const Color kTextDark = Color(0xFFF1F5F9); // Light text for dark mode

const Color kSubtextLight = Color(0xFF64748B); // Muted text for light mode
const Color kSubtextDark = Color(0xFFCBD5E1); // Muted text for dark mode

const Color kBackgroundLight = Color(0xFFF8FAFC); // Light background
const Color kBackgroundDark = Color(0xFF0F172A); // Dark background

const Color kCardLight = Color(0xFFFFFFFF); // Light card
const Color kCardDark = Color(0xFF1E293B); // Dark card
const double kDefaultPadding = 16.0;
const double kCardBorderRadius = 12.0;
const double kIconSize = 24.0;

/// Get primary color based on theme mode
Color getPrimaryColor(bool isDark) {
  return isDark ? kPrimaryColorDark : kPrimaryColorLight;
}

/// Get secondary color based on theme mode
Color getSecondaryColor(bool isDark, {required String theme}) {
  return isDark ? kSecondaryColorDark : kSecondaryColorLight;
}

/// Get accent color based on theme mode
Color getAccentColor(bool isDark) {
  return isDark ? kAccentColorDark : kAccentColorLight;
}

/// Get text color based on theme mode
Color getTextColor(bool isDark) {
  return isDark ? kTextDark : kTextLight;
}

/// Get subtext color based on theme mode
Color getSubtextColor(bool isDark) {
  return isDark ? kSubtextDark : kSubtextLight;
}

/// Get background color based on theme mode
Color getBackgroundColor(bool isDark) {
  return isDark ? kBackgroundDark : kBackgroundLight;
}

/// Get card color based on theme mode
Color getCardColor(bool isDark) {
  return isDark ? kCardDark : kCardLight;
}
