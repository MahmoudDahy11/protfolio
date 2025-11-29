import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Anti-Gravity Colors
  static const Color primaryColor = Color(0xFF6C63FF); // Electric Violet
  static const Color accentColor = Color(0xFF00F0FF); // Cyan Neon
  static const Color darkBackground = Color(0xFF0A0E21); // Deep Space Blue
  static const Color lightBackground = Color(0xFFF5F7FA); // Soft Cloud White

  static const Color darkSurface = Color(0xFF1D1E33);
  static const Color lightSurface = Colors.white;

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryColor, accentColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient darkCardGradient = LinearGradient(
    colors: [Color(0xFF2A2D3E), Color(0xFF1F2235)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Shadows (Anti-Gravity Glow)
  static List<BoxShadow> floatingShadow(bool isDark) => [
    BoxShadow(
      color: isDark
          ? primaryColor.withValues(alpha: .3)
          : Colors.black.withValues(alpha: .1),
      blurRadius: 20,
      offset: const Offset(0, 10),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: isDark
          ? accentColor.withValues(alpha: .1)
          : Colors.blue.withValues(alpha: .05),
      blurRadius: 30,
      offset: const Offset(0, 15),
      spreadRadius: -5,
    ),
  ];

  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: lightBackground,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: accentColor,
      surface: lightSurface,
    ),
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: Colors.white,
      displayColor: Colors.black87,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
  );

  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkBackground,
    colorScheme: ColorScheme.dark(
      primary: primaryColor,
      secondary: accentColor,
      surface: darkSurface,
    ),
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
  );
}
