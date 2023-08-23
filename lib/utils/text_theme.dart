import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.C_30A2C5,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.C_30A2C5,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.C_30A2C5,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    textTheme: TextTheme(
      //display
      displayLarge: TextStyle(
          color: AppColors.black,
          fontSize: 70.sp,
          fontWeight: FontWeight.w300,
          fontFamily: "Montserrat"),
      displayMedium: TextStyle(
          color: AppColors.textColor,
          fontSize: 45.sp,
          fontWeight: FontWeight.w700,
          fontFamily: "Montserrat"),
      displaySmall: TextStyle(
          color: AppColors.textColor,
          fontSize: 40.sp,
          fontWeight: FontWeight.w700,
          fontFamily: "Montserrat"),
      //headline
      headlineLarge: TextStyle(
          color: AppColors.textColor,
          fontSize: 32.sp,
          fontWeight: FontWeight.w700,
          fontFamily: "Montserrat"),
      headlineMedium: TextStyle(
          color: AppColors.textColor,
          fontSize: 28.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Montserrat"),
      headlineSmall: TextStyle(
          color: AppColors.textColor,
          fontSize: 24.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "Montserrat"),
      //title
      titleLarge: TextStyle(
          color: AppColors.textColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "Montserrat"),
      titleMedium: TextStyle(
          color: AppColors.textColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "Montserrat"),
      titleSmall: TextStyle(
          color: AppColors.textColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Montserrat"),
      //label
      labelLarge: TextStyle(
          color: AppColors.textColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "Montserrat"),
      labelMedium: TextStyle(
          color: AppColors.textColor,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Montserrat"),
      labelSmall: TextStyle(
          color: AppColors.textColor,
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Montserrat"),
      //body
      bodySmall: const TextStyle(
          color: AppColors.passiveTextColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: "Montserrat"),
      bodyMedium: TextStyle(
          color: AppColors.textColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "Montserrat"),
      bodyLarge: TextStyle(
          color: AppColors.textColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
          fontFamily: "Montserrat"),
    ),
  );
  static ThemeData lightTheme = ThemeData();
}