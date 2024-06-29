// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BubbleTapping extends StatefulWidget {
  Widget child;
  BubbleTapping({
    super.key,
    required this.child,
  });

  @override
  State<BubbleTapping> createState() => _BubbleTappingState();
}

class _BubbleTappingState extends State<BubbleTapping> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isPressed ? .97 : 1,
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
        child: widget.child,
      ),
    );
  }
}
