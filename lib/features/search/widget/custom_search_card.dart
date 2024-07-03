// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_care/common/colors/app_colors.dart';

import 'package:home_care/features/home/widget/bubble_tapping.dart';

class CustomSearchCard extends StatefulWidget {
  IconData icon;
  String name;
  CustomSearchCard({
    super.key,
    required this.icon,
    required this.name,
  });

  @override
  State<CustomSearchCard> createState() => _CustomSearchCardState();
}

class _CustomSearchCardState extends State<CustomSearchCard> {
  @override
  Widget build(BuildContext context) {
    return BubbleTapping(
      child: Container(
        height: ScreenUtil().screenHeight * 0.15,
        width: ScreenUtil().screenWidth * 0.4,
        decoration: BoxDecoration(
          color: AppColors.primaryGreen.withOpacity(0.2),
          borderRadius: BorderRadius.all(Radius.circular(30.h)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 22.w, horizontal: 14.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                widget.icon,
                size: 32,
                color: AppColors.orange.withOpacity(0.8),
              ),
              Text(
                widget.name,
                style: GoogleFonts.urbanist(
                    fontSize: 18.sp, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
