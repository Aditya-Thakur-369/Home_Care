// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:home_care/common/colors/app_colors.dart';

class DynamicFilledButton extends StatefulWidget {
  const DynamicFilledButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.widthFactor,
    this.color,
    this.padding,
  });

  final Widget child;
  final FutureOr<void> Function()? onPressed;
  final double? widthFactor;
  final Color? color;
  final EdgeInsets? padding;

  @override
  State<DynamicFilledButton> createState() => _DynamicFilledButtonState();
}

class _DynamicFilledButtonState extends State<DynamicFilledButton> {
  bool isLoading = false;

  func() async {
    setState(() {
      isLoading = true;
    });
    await widget.onPressed!();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return PopScope(
        canPop: !isLoading,
        child: Opacity(
          opacity: widget.onPressed == null ? .8 : 1,
          child: CupertinoButton(
            borderRadius: BorderRadius.circular(1002),
            padding: widget.padding ??
                const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            color: widget.color ?? AppColors.primaryGreen,
            onPressed: widget.onPressed == null
                ? null
                : widget.onPressed == null
                    ? null
                    : (isLoading ? null : func),
            child:
                isLoading ? const CupertinoActivityIndicator() : widget.child,
          ),
        ),
      );
    }
    return PopScope(
      canPop: !isLoading,
      child: Opacity(
        opacity: widget.onPressed == null ? .8 : 1,
        child: FilledButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.color ?? const Color(0xFF1721F0),
            padding: widget.padding ??
                const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          ),
          onPressed: widget.onPressed == null
              ? null
              : widget.onPressed == null
                  ? null
                  : (isLoading ? null : func),
          child: isLoading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(),
                )
              : widget.child,
        ),
      ),
    );
  }
}
