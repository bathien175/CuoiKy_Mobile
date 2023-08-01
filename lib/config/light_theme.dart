import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '/config/pallete.dart';

import 'constants.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Palette.kToColor,
  brightness: Brightness.light,
  scaffoldBackgroundColor: kLightBackground,
  disabledColor: const Color(0xFFC4C9D6),
  primaryColorDark: kLightStrokeColor,
  primaryColorLight: kLightFillColor,
  primaryColor: kLightPrimary,
  shadowColor: Colors.white,
  cardColor: const Color(0xffF1F3F6),
  dividerColor: kLightDividerColor,
  iconTheme: const IconThemeData(
    color: kLightHintTextColor,
  ),
  appBarTheme:  AppBarTheme(
  // centerTitle: true,
   titleTextStyle: GoogleFonts.dmSans(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF151B33),
    ),
    backgroundColor: kLightBackground,
    iconTheme: const IconThemeData(
      color: Color(0xFF151B33),
    )
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: GoogleFonts.dmSans(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: kLightHintTextColor,
    ),
    filled: true,
    fillColor: kLightFillColor,
    focusColor: const Color(0xFF3D5BF6),
   border: kLightInputBorder,
   enabledBorder: kLightInputBorder,
   focusedBorder: kLightInputFocusBorder,
   contentPadding: REdgeInsets.all(14)
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
  
    style: ButtonStyle(
      
      elevation: MaterialStateProperty.all(5),
      minimumSize: MaterialStateProperty.all(
        Size(double.infinity, 54.h),
      ),
      shape: MaterialStateProperty.all(
        const StadiumBorder(),
      ),
      
      foregroundColor: MaterialStateProperty.all(
        elevatedButtonTextColor,
      ),
      textStyle: MaterialStateProperty.all(
         GoogleFonts.dmSans(
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
      color: elevatedButtonTextColor,
    ),

      ),
    ),
  ),

  textTheme: TextTheme(
   labelLarge: GoogleFonts.dmSans(
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
      color: const Color(0xFFFFFFFF),
    ),
     displayLarge: GoogleFonts.dmSans(
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      color: const Color(0xFF151B33),
    ),
     displayMedium: GoogleFonts.dmSans(
      fontSize: 22.sp,
      fontWeight: FontWeight.w700,
      color: const Color(0xFF151B33),
    ),
     displaySmall: GoogleFonts.dmSans(
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      color: const Color(0xFF151B33),
    ),
    headlineMedium: GoogleFonts.dmSans(
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      color: const Color(0xFF151B33),
    ),
     headlineSmall: GoogleFonts.dmSans(
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
      color: const Color(0xFF151B33),
    ),
    titleLarge: GoogleFonts.dmSans(
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
      color: const Color(0xFF151B33),
    ),
   titleMedium:GoogleFonts.dmSans(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF151B33),
    ),
    titleSmall:GoogleFonts.dmSans(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF3F6DF6),
    ),
    bodyLarge: GoogleFonts.dmSans(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: kLightTextColor,
    ),
     bodyMedium: GoogleFonts.dmSans(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: kLightTextColor,
    ),
  ), bottomAppBarTheme: const BottomAppBarTheme(color: kLightPrimary),
);