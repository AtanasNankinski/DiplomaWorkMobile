import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:diploma_work_mobile/theme/theme_colors.dart';

ThemeData mainTheme = ThemeData(
  primaryColor: colorPrimary,
  textTheme: textTheme,
  elevatedButtonTheme: elevatedButtonThemeData,
);

TextTheme textTheme = TextTheme(
  displayLarge: GoogleFonts.roboto(
    textStyle: TextStyle(
      color: colorTextMain,
      fontSize: 42,
      fontWeight: FontWeight.w500,
    ),
  ),
  bodyLarge: GoogleFonts.roboto(
    textStyle: TextStyle(
      color: colorTextMain,
      fontSize: 24,
      fontWeight: FontWeight.w500,
    ),
  ),
  bodyMedium: GoogleFonts.inter(
      textStyle: TextStyle(
        color: colorTextMain,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      )
  ),
  bodySmall: GoogleFonts.inter(
    textStyle: TextStyle(
      color: colorTextMain,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
  )
);

ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    minimumSize: const Size(100, 40),
    backgroundColor: colorButtonMain,
    foregroundColor: colorButtonText,
    elevation: 0,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(30)
        )
    ),
    textStyle: GoogleFonts.inter(
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        )
    ),
  ),
);