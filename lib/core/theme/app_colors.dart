import 'package:flutter/material.dart';

class AppColors {
  // Primary colors
  static const Color primaryBlue = Color(0xFF004AAC);
  static const Color darkNavy = Color(0xFF1A1A2E);

  // Background and surface colors
  static const Color background = Color(0xFFF9F9F9);
  static const Color productBackground = Color(0xFFEBEBEB);
  static const Color surface = Colors.white;
  static const Color imagePlaceholder = Color(0xFFF4F4F4);

  // Text and UI gray scale
  static const Color textMain = Color(0xFF1A1A2E);
  static const Color textSubtitle = Color(0xFF666666);
  static const Color textLight = Color(0xFF999999);

  // Functional colors
  static const Color starGold = Color(0xFFFFC107);
  static const Color error = Colors.redAccent;

  // Transparent variants
  static Color primaryWithOpacity(double opacity) =>
      primaryBlue.withValues(alpha: opacity);
  static Color blackWithOpacity(double opacity) =>
      Colors.black.withValues(alpha: opacity);
}
