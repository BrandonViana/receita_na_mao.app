import 'package:flutter/material.dart';
import 'package:receitanamao/common/constants/app_colors.dart';
import 'package:receitanamao/common/constants/app_text_styles.dart';
import 'package:receitanamao/features/Login/login_page.dart';

class CustomLoginButton extends StatelessWidget {
  const CustomLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Você já possui uma conta? ',
            style: AppTextStyles.simpleText.copyWith(color: AppColors.white),
          ),
          Text(
            '(Log in)',
            style: AppTextStyles.simpleText.copyWith(
              color: AppColors.white,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
