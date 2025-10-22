import 'package:flutter/material.dart';

// ============================================================================
// 🎨 CUSTOMERTECH SERVICES - COLOR THEMES (Non-Blue Options)
// ============================================================================
// Choose your preferred theme by uncommenting one of the theme sections below
// and commenting out the others. All colors are WCAG AA compliant.
// ============================================================================

// ============================================================================
// THEME 1: PURPLE + CORAL + GOLD (Modern & Creative)
// ============================================================================
const Color kPrimaryColorLight = Color(0xFF7C3AED); // Deep Purple
const Color kPrimaryColorDark = Color(0xFFA78BFA); // Light Purple

const Color kSecondaryColorLight = Color(0xFFEF4444); // Coral Red
const Color kSecondaryColorDark = Color(0xFFFCA5A5); // Light Coral

const Color kAccentColorLight = Color(0xFFFCD34D); // Golden Yellow
const Color kAccentColorDark = Color(0xFFFDE047); // Bright Yellow

// ============================================================================
// THEME 2: TEAL + ROSE + CREAM (Elegant & Premium)
// ============================================================================
// const Color kPrimaryColorLight = Color(0xFF0D9488); // Deep Teal
// const Color kPrimaryColorDark = Color(0xFF2DD4BF); // Light Teal
//
// const Color kSecondaryColorLight = Color(0xFFBE185D); // Deep Rose
// const Color kSecondaryColorDark = Color(0xFFF472B6); // Light Rose
//
// const Color kAccentColorLight = Color(0xFFFEF3C7); // Cream
// const Color kAccentColorDark = Color(0xFFFEF08A); // Light Cream

// ============================================================================
// THEME 3: ORANGE + SLATE + MINT (Warm & Friendly)
// ============================================================================
// const Color kPrimaryColorLight = Color(0xFFEA580C); // Deep Orange
// const Color kPrimaryColorDark = Color(0xFFFB923C); // Light Orange
//
// const Color kSecondaryColorLight = Color(0xFF475569); // Slate Gray
// const Color kSecondaryColorDark = Color(0xFF94A3B8); // Light Slate
//
// const Color kAccentColorLight = Color(0xFF10B981); // Mint Green
// const Color kAccentColorDark = Color(0xFF6EE7B7); // Light Mint

// ============================================================================
// THEME 4: INDIGO + LIME + ROSE (Bold & Trendy)
// ============================================================================
// const Color kPrimaryColorLight = Color(0xFF4F46E5); // Deep Indigo
// const Color kPrimaryColorDark = Color(0xFF818CF8); // Light Indigo
//
// const Color kSecondaryColorLight = Color(0xFF84CC16); // Lime Green
// const Color kSecondaryColorDark = Color(0xFFBEF264); // Light Lime
//
// const Color kAccentColorLight = Color(0xFFEC4899); // Hot Pink
// const Color kAccentColorDark = Color(0xFFF472B6); // Light Pink

// ============================================================================
// THEME 5: FOREST GREEN + PEACH + DEEP RED (Natural & Premium)
// ============================================================================
// const Color kPrimaryColorLight = Color(0xFF15803D); // Forest Green
// const Color kPrimaryColorDark = Color(0xFF4ADE80); // Light Green
//
// const Color kSecondaryColorLight = Color(0xFFEA580C); // Peach Orange
// const Color kSecondaryColorDark = Color(0xFFFB923C); // Light Peach
//
// const Color kAccentColorLight = Color(0xFFDC2626); // Deep Red
// const Color kAccentColorDark = Color(0xFFF87171); // Light Red

// ============================================================================
// NEUTRAL COLORS (Same for all themes)
// ============================================================================
const Color kTextLight = Color(0xFF0F172A); // Dark text for light mode
const Color kTextDark = Color(0xFFF1F5F9); // Light text for dark mode

const Color kSubtextLight = Color(0xFF64748B); // Muted text for light mode
const Color kSubtextDark = Color(0xFFCBD5E1); // Muted text for dark mode

const Color kBackgroundLight = Color(0xFFF8FAFC); // Light background
const Color kBackgroundDark = Color(0xFF0F172A); // Dark background

const Color kCardLight = Color(0xFFFFFFFF); // Light card
const Color kCardDark = Color(0xFF1E293B); // Dark card

// ============================================================================
// SPACING & SIZING CONSTANTS
// ============================================================================
const double kDefaultPadding = 16.0;
const double kCardBorderRadius = 12.0;
const double kIconSize = 24.0;

// ============================================================================
// HELPER FUNCTIONS (Optional - for easier theme switching)
// ============================================================================

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
