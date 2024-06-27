// phone_input_field.dart

// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:home_care/common/colors/app_colors.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final String? Function(String?) validator;
  final String? inputLabel;

  InputTextField({
    required this.controller,
    required this.onChanged,
    required this.validator,
    required this.inputLabel,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.inputGrey,
        hintText: inputLabel,
        contentPadding: EdgeInsets.all(8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
