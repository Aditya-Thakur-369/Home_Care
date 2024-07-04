import 'package:flutter/material.dart';

class MasterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.strokeWidth = 2;
    // paint.color = const Color.fromARGB(255, 134, 172, 230);
    paint.color = Colors.lightGreen;
    paint.maskFilter = const MaskFilter.blur(BlurStyle.normal, 92);

    canvas.drawCircle(Offset(size.width, 320), 150, paint);

    Paint paint1 = Paint();
    paint1.strokeWidth = 2;
    paint1.color = Colors.redAccent.withOpacity(0.7);
    paint1.maskFilter = const MaskFilter.blur(BlurStyle.normal, 92);

    canvas.drawCircle(Offset(0, size.height / 2 + 100), 150, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
