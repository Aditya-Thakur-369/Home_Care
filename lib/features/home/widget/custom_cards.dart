// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:home_care/common/colors/app_colors.dart';
import 'package:home_care/features/home/widget/bubble_tapping.dart';

class CustomCardsView extends StatefulWidget {
  IconData icon;
  String name;
  bool isTop;
  CustomCardsView({
    super.key,
    required this.icon,
    required this.name,
    this.isTop = false,
  });

  @override
  State<CustomCardsView> createState() => _CustomCardsViewState();
}

class _CustomCardsViewState extends State<CustomCardsView> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
        scale: isPressed ? 1 : .95,
        duration: const Duration(milliseconds: 100),
        child: GestureDetector(
            onTapDown: (_) {
              setState(() {
                isPressed = true;
              });
            },
            onTapUp: (_) {
              setState(() {
                isPressed = false;
              });
            },
            onTapCancel: () {
              setState(() {
                isPressed = false;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: ScreenUtil().screenHeight * 0.15,
              width: ScreenUtil().screenWidth * 0.3,
              decoration: BoxDecoration(
                boxShadow: [
                  // BoxShadow(
                  //     color: AppColors.primaryGreen,
                  //     blurStyle: BlurStyle.outer,
                  //     blurRadius: 200,
                  //     spreadRadius: 10)
                  isPressed
                      ? BoxShadow(
                          color: AppColors.primaryGreen,
                          blurStyle: BlurStyle.outer,
                          blurRadius: 20,
                          spreadRadius: 2)
                      : const BoxShadow(color: Colors.transparent)
                ],
                gradient: LinearGradient(
                    colors: widget.isTop
                        ? [
                            AppColors.primaryGreen.withOpacity(0.8),
                            AppColors.primaryGreen.withOpacity(0.3),
                          ]
                        : [
                            AppColors.primaryGreen.withOpacity(0.3),
                            AppColors.primaryGreen.withOpacity(0.8),
                          ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
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
                      color: !widget.isTop
                          ? Colors.white.withOpacity(0.8)
                          : AppColors.primaryGreen.withOpacity(0.8),
                    ),
                    Text(
                      widget.name,
                      style: GoogleFonts.urbanist(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: widget.isTop
                              ? AppColors.primaryGreen
                              : Colors.white),
                    )
                  ],
                ),
              ),
            )));
  }
}
