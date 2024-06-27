import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_care/common/colors/app_colors.dart';

class ScaleButton extends StatefulWidget {
  const ScaleButton(
      {super.key, required this.onTap, required this.text, this.color});

  @override
  State<ScaleButton> createState() => _ScaleButtonState();
  final VoidCallback? onTap;
  final String text;
  final Color? color;
}

class _ScaleButtonState extends State<ScaleButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isPressed ? .97 : 1,
      duration: const Duration(milliseconds: 100),
      child: GestureDetector(
        onTap: widget.onTap == null
            ? null
            : () {
                if (widget.onTap != null) {
                  setState(() {
                    isPressed = true;
                  });
                  Future.delayed(const Duration(milliseconds: 50))
                      .then((value) {
                    setState(() {
                      isPressed = false;
                    });
                    widget.onTap!();
                  });
                }
              },
        onTapDown: (_) {
          if (widget.onTap != null) {
            setState(() {
              isPressed = true;
            });
          }
        },
        onTapUp: (_) {
          if (widget.onTap != null) {
            setState(() {
              isPressed = false;
            });
          }
        },
        onTapCancel: () {
          if (widget.onTap != null) {
            setState(() {
              isPressed = false;
            });
          }
        },
        child: Container(
          height: 58.h,
          decoration: BoxDecoration(
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
