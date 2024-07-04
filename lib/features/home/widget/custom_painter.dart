import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:home_care/common/colors/app_colors.dart';

class MasterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint p1 = Paint();
    p1.color = AppColors.primaryGreen;
    p1.strokeWidth = 2;
    p1.maskFilter = const MaskFilter.blur(BlurStyle.normal, 92);

    canvas.drawCircle(const Offset(150, 150), 60, p1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
