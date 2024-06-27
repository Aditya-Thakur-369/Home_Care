// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_care/common/colors/app_colors.dart';
class AppTextStyle {
  // Large text Styles are here
  static TextStyle xlprimarygreen = GoogleFonts.urbanist(
      textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.primaryGreen,
          fontSize: 24.sp));

  static TextStyle lblack = GoogleFonts.urbanist(
      textStyle: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24.sp,
    color: Colors.black,
  ));

  static TextStyle lblacklight = GoogleFonts.urbanist(
      textStyle: TextStyle(
          fontWeight: FontWeight.w300, color: Colors.black, fontSize: 24.sp));

  // Middle Text styles are here

  static TextStyle mblacklight = GoogleFonts.urbanist(
      textStyle: TextStyle(
          fontSize: 20.sp, color: Colors.black, fontWeight: FontWeight.w600));

  // Small text Styles are here
  static TextStyle xsblack = GoogleFonts.urbanist(
      textStyle: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16.sp));
  static TextStyle xxxsblack = GoogleFonts.urbanist(
      textStyle: TextStyle(
          fontSize: 12.sp,
          color: Colors.black,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.2));
  static TextStyle xxsblack = GoogleFonts.urbanist(
    textStyle: TextStyle(
      fontSize: 16.sp,
      letterSpacing: 0.2.sp,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  );

  static TextStyle xxsblackmiddel = GoogleFonts.urbanist(
      textStyle: TextStyle(
          fontSize: 16.sp,
          color: Colors.black,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2));

  static TextStyle xxsblacklight = GoogleFonts.urbanist(
      textStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.black,
          fontSize: 16.sp,
          letterSpacing: 0.2));

  static TextStyle sgrey = GoogleFonts.urbanist(
      textStyle: TextStyle(
    color: Colors.grey.shade700,
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
  ));
  static TextStyle sblack = GoogleFonts.urbanist(
      textStyle: TextStyle(
    color: Colors.black,
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
  ));

  static TextStyle swhite = GoogleFonts.urbanist(
      textStyle: TextStyle(
    color: Colors.white,
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
  ));

  static TextStyle sblacklight = GoogleFonts.urbanist(
      textStyle: TextStyle(
          fontSize: 18.sp,
          color: Colors.grey.shade700,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2));

  static TextStyle sblackbold = GoogleFonts.urbanist(
      textStyle: TextStyle(
          fontSize: 18.sp,
          color: Colors.black,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2));

  static TextStyle sprimarygreen = GoogleFonts.urbanist(
      textStyle: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.2,
          color: AppColors.primaryGreen));
}
