import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:projetopet/common/constants/app_colors.dart';
import 'package:projetopet/common/constants/app_text_styles.dart';
import 'package:projetopet/common/constants/widgets/custom_border.dart';
import 'package:projetopet/common/constants/widgets/password_field.dart';
import 'package:projetopet/common/constants/widgets/second_button.dart';
import 'package:projetopet/features/splash/splash_page.dart';
import 'register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        decoration: const BoxDecoration(color: AppColors.orange),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        borderRadius: BorderRadius.circular(50),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Image.asset(
                            "assets/Image/left.png",
                            width: 25,
                            height: 25,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Login',
                        style: AppTextStyles.textAll.copyWith(
                          color: AppColors.blueBorder,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                TextField(decoration: CustomBorder.build('Email')),
                const SizedBox(height: 20),
                PasswordField(label: 'Senha'),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Esqueceu a senha?',
                          style: AppTextStyles.textAll.copyWith(
                            color: AppColors.white,
                          ),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SplashPage(),
                                    ),
                                  );
                                },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SecondButton(text: 'Entrar', onPressed: () {}),
                const Spacer(),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Não tem uma conta? ',
                        style: AppTextStyles.textAll.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      TextSpan(
                        text: 'Registrar',
                        style: AppTextStyles.textAll.copyWith(
                          color: AppColors.white,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RegisterPage(),
                                  ),
                                );
                              },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
