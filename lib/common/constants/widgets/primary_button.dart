import 'package:flutter/material.dart';
import 'package:receitanamao/common/constants/app_colors.dart';
import 'package:receitanamao/common/constants/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const PrimaryButton({this.onPressed, required this.text, super.key});

  final BorderRadius _borderRadius = const BorderRadius.all(
    Radius.circular(30.0),
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: _borderRadius,
      child: Ink(
        height: 50.0,
        width: 300.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors:
                onPressed != null
                    ? AppColors.buttomGradient
                    : AppColors.greyGradient,
          ),
          borderRadius: _borderRadius,
        ),
        child: InkWell(
          borderRadius: _borderRadius,
          onTap: onPressed,
          child: Align(
            child: Text(
              text,
              style: AppTextStyles.simpleText.copyWith(color: AppColors.black),
            ),
          ),
        ),
      ),
    );
  }
}
