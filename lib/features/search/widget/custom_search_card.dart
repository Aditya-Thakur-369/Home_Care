// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:home_care/common/colors/app_colors.dart';
import 'package:home_care/features/home/widget/bubble_tapping.dart';

class CustomSearchCard extends StatefulWidget {
  IconData icon;
  String name;
  bool isLeft;
  final VoidCallback onPressed;
  CustomSearchCard({
    super.key,
    required this.icon,
    required this.name,
    this.isLeft = false,
    required this.onPressed,
  });

  @override
  State<CustomSearchCard> createState() => _CustomSearchCardState();
}

class _CustomSearchCardState extends State<CustomSearchCard> {
  @override
  Widget build(BuildContext context) {
    return BubbleTapping(
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          height: ScreenUtil().screenHeight * 0.2,
          width: ScreenUtil().screenWidth * 0.45,
          decoration: BoxDecoration(
            // color: AppColors.primaryGreen.withOpacity(0.2),
            gradient: LinearGradient(
                colors: widget.isLeft
                    ? [
                        AppColors.primaryGreen.withOpacity(0.5),
                        AppColors.primaryGreen.withOpacity(0.2)
                      ]
                    : [
                        AppColors.primaryGreen.withOpacity(0.2),
                        AppColors.primaryGreen.withOpacity(0.5)
                      ]),

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
                  size: 45,
                  color: AppColors.primaryGreen.withOpacity(0.8),
                ),
                Text(
                  widget.name,
                  style: GoogleFonts.urbanist(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
