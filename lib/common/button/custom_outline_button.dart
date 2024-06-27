// ignore_for_file: public_member_api_docs, sort_constructors_first, use_super_parameters, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_care/common/colors/app_colors.dart';

class CustomOutlineButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? color;

  CustomOutlineButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.color,
  }) : super(key: key);

  @override
  State<CustomOutlineButton> createState() => _CustomOutlineButtonState();
}

class _CustomOutlineButtonState extends State<CustomOutlineButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isPressed ? .97 : 1,
      duration: const Duration(milliseconds: 100),
      child: GestureDetector(
        // borderRadius: BorderRadius.circular(30.h),
        // onTap: widget.onPressed != null ? () => widget.onPressed!() : null,
        onTap: widget.onPressed == null
            ? null
            : () {
                if (widget.onPressed != null) {
                  setState(() {
                    isPressed = true;
                  });
                  Future.delayed(const Duration(milliseconds: 50))
                      .then((value) {
                    setState(() {
                      isPressed = false;
                    });
                    widget.onPressed!();
                  });
                }
              },
        onTapDown: (_) {
          if (widget.onPressed != null) {
            setState(() {
              isPressed = true;
            });
          }
        },
        onTapUp: (_) {
          if (widget.onPressed != null) {
            setState(() {
              isPressed = false;
            });
          }
        },
        onTapCancel: () {
          if (widget.onPressed != null) {
            setState(() {
              isPressed = false;
            });
          }
        },
        child: Container(
          height: 58.h,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: widget.color ?? AppColors.primaryGreen, width: 1.5),
            borderRadius: BorderRadius.circular(30.h),
          ),
          child: Center(
            child: Text(
              widget.text,
              style: GoogleFonts.urbanist(
                textStyle: TextStyle(
                  fontSize: 16.sp,
                  letterSpacing: 0.2,
                  fontWeight: FontWeight.bold,
                  color: widget.color ?? AppColors.primaryGreen,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
