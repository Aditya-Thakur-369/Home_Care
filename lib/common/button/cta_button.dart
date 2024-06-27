// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_care/common/colors/app_colors.dart';


class CtaButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;
  final Color textColor;
  final bool isLoading;

  CtaButton(
      {required this.text,
      required this.color,
      required this.onTap,
      required this.textColor,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(1002),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(1002),
        ),
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Center(
            child: isLoading
                ? SizedBox(
                    height: 22.h,
                    width: 22.w,
                    child: CircularProgressIndicator(
                      color: AppColors.white,
                    ),
                  )
                : Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  )),
      ),
    );
  }
}
