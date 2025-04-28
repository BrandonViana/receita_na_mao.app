import 'package:flutter/material.dart';
import 'package:projetopet/common/constants/app_colors.dart';

class CustomBorder {
  static InputDecoration build(
    String label, {
    TextStyle? labelStyle,
    TextStyle? floatingLabelStyle,
    Color? borderColor,
  }) {
    final color = borderColor ?? AppColors.orange;
    return InputDecoration(
      labelText: label,
      labelStyle: labelStyle,
      floatingLabelStyle: floatingLabelStyle,
      filled: true,
      fillColor: AppColors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: color),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: color, width: 2),
      ),
    );
  }
}
