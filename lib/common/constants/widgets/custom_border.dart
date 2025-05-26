import 'package:flutter/material.dart';
import 'package:receitanamao/common/constants/app_colors.dart';

class CustomBorder {
  static InputDecoration build(
    String label, {
    TextStyle? labelStyle,
    TextStyle? floatingLabelStyle,
    Color? borderColor,
  }) {
    return InputDecoration(
      labelText: label,
      labelStyle:
          labelStyle ??
          TextStyle(
            fontFamily: 'OpenSanst',
            fontSize: 15,
            color: AppColors.white,
          ),
      floatingLabelStyle:
          floatingLabelStyle ??
          TextStyle(
            fontFamily: 'OpenSanst',
            fontSize: 15,
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
      filled: true,
      fillColor: Colors.transparent,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.white),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.white, width: 2),
      ),
    );
  }
}
