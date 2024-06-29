// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_care/common/colors/app_colors.dart';

class AppTextStyle {
  // Large text Styles are here
  static TextStyle smalltext = GoogleFonts.urbanist(
      fontSize: 16.sp, color: AppColors.white, fontWeight: FontWeight.w200);

  static TextStyle middletext =
      GoogleFonts.urbanist(fontSize: 18.sp, color: AppColors.white);
  static TextStyle largeboldtext = GoogleFonts.urbanist(
      fontSize: 32.sp, color: AppColors.white, fontWeight: FontWeight.bold);
}
