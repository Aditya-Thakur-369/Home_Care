// ignore_for_file: public_member_api_docs, sort_constructors_first, use_super_parameters, must_be_immutable, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_care/common/colors/app_colors.dart';
import 'package:home_care/common/textstyle/app_textStyles.dart';

class CustomButton extends StatefulWidget {
  Color color;
  String name;
  IconData? icon;
  final VoidCallback onPressed;
  final bool isLoading;
  CustomButton({
    Key? key,
    required this.color,
    required this.name,
    required this.icon,
    required this.onPressed,
    required this.isLoading,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
//   @override
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: widget.isLoading,
      child: AnimatedScale(
        scale: isPressed ? .97 : 1,
        duration: const Duration(milliseconds: 100),
        child: GestureDetector(
          onTap: widget.onPressed == null
              ? null
              : () {
                  setState(() {
                    isPressed = true;
                  });
                  Future.delayed(const Duration(milliseconds: 50))
                      .then((value) {
                    setState(() {
                      isPressed = false;
                    });
                    widget.onPressed();
                  });
                },
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
          child: Container(
            height: 58.h,
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(30.h),
            ),
            child: widget.isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.white,
                    ),
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.name,
                      ),
                      widget.icon == null
                          ? SizedBox(
                              width: 10.w,
                            )
                          : const SizedBox.shrink(),
                      widget.icon != null
                          ? Icon(
                              widget.icon,
                              color: Colors.white,
                              size: 24.sp,
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
