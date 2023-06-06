import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:diploma_work_mobile/misc/util/colors.dart';

ThemeData mainTheme = ThemeData(
  primaryColor: colorPrimary,
  textTheme: textTheme,
  elevatedButtonTheme: elevatedButtonThemeData,
  listTileTheme: listTileTheme,
  outlinedButtonTheme: outlinedButtonThemeData,
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

OutlinedButtonThemeData outlinedButtonThemeData = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    minimumSize: const Size(100, 40),
    elevation: 0,
    side: const BorderSide(
      color: colorButtonMain,
      width: 2,
    ),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0)
    ),
    textStyle: GoogleFonts.inter(
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        )
    ),
  ),
);

ListTileThemeData listTileTheme = ListTileThemeData(
  iconColor: colorMenuIcons,
);