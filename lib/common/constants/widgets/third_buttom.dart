import 'package:flutter/material.dart';
import 'package:receitanamao/common/constants/app_colors.dart';
import 'package:receitanamao/common/constants/app_text_styles.dart';

class ThirdButtom extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Icon icon;

  const ThirdButtom({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
  });

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
                    ? AppColors.orangeGradient
                    : AppColors.greyGradient,
          ),
          borderRadius: _borderRadius,
        ),
        child: InkWell(
          borderRadius: _borderRadius,
          onTap: onPressed,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: AppTextStyles.simpleText.copyWith(
                    color: AppColors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 8),
                icon,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
