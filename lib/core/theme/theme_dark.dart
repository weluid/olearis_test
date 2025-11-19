import 'package:olearistest/core/theme/colors.dart';
import 'package:flutter/material.dart';

class ThemeDark {
  static final AppColor _colors = AppColorDark();

  static ThemeData dark = ThemeData(
    textTheme: _textTheme(),
    outlinedButtonTheme: _outLinedButtonTheme(),
    inputDecorationTheme: _inputDecorationTheme(),
    scaffoldBackgroundColor: _colors.background,
    dividerColor: _colors.borderColor,
    bottomNavigationBarTheme: _bottomNavigationBarTheme(),
    cardTheme: _cardTheme(),
    dividerTheme: _dividerTheme(),
    textSelectionTheme: _textSelectionTheme(),
  );

  static DividerThemeData _dividerTheme() {
    return DividerThemeData(
      color: _colors.dividerColor,
      indent: 0,
      endIndent: 0,
      thickness: 1,
    );
  }

  static CardThemeData _cardTheme() {
    return const CardThemeData(
      elevation: 0,
      margin: EdgeInsets.zero,
      color: Colors.transparent,
    );
  }

  static BottomNavigationBarThemeData _bottomNavigationBarTheme() {
    return BottomNavigationBarThemeData(
      selectedItemColor: _colors.primary,
      unselectedItemColor: _colors.inactiveColor,
      backgroundColor: Colors.white,
      elevation: 6,
    );
  }

  static OutlinedButtonThemeData _outLinedButtonTheme() {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: _colors.primary,
        disabledBackgroundColor: _colors.primary.withValues(alpha: 0.38),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        side: const BorderSide(color: Colors.transparent),
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }

  static TextTheme _textTheme() {
    return TextTheme(
      displayLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: _colors.text,
      ),
      displayMedium: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w900,
        color: _colors.text,
      ),
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: _colors.text,
      ),
      headlineMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: _colors.text,
      ),
      headlineSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: _colors.text,
      ),
      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: _colors.text,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: _colors.text,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: _colors.text,
      ),
      bodyLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: _colors.text,
      ),
      bodyMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: _colors.text,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: _colors.text,
      ),
    );
  }

  static InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: _colors.text),
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),

      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      focusedBorder: UnderlineInputBorder(

        borderSide: BorderSide(color: _colors.accentColor, width: 2),
      ),
    );
  }

  static TextSelectionThemeData _textSelectionTheme() {
    return TextSelectionThemeData(
      cursorColor: _colors.accentColor,
      selectionHandleColor: _colors.accentColor,
    );
  }
}
