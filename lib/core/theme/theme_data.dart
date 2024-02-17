import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mehyay/core/theme/palette.dart';

final themeData = ThemeData(
  primaryColor: Palette.primary,
  primaryColorDark: Palette.primaryDark,
  primaryColorLight: Palette.primaryLight,
  scaffoldBackgroundColor: Palette.background,
  textTheme: GoogleFonts.tajawalTextTheme(),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: Palette.grey),
      borderRadius: BorderRadius.circular(Palette.mBorderRadius),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Palette.grey),
      borderRadius: BorderRadius.circular(Palette.mBorderRadius),
    ),
    outlineBorder: const BorderSide(color: Palette.grey),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Palette.grey),
      borderRadius: BorderRadius.circular(Palette.mBorderRadius),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 60),
        backgroundColor: Palette.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Palette.mBorderRadius),
        ),
        textStyle: Palette.label,
        foregroundColor: Palette.white),
  ),
);
