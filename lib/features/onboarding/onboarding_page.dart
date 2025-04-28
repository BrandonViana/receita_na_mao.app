import 'package:flutter/material.dart';
import 'package:projetopet/common/constants/app_colors.dart';
import 'package:projetopet/common/constants/app_text_styles.dart';
import 'package:projetopet/common/constants/widgets/custom_login_button.dart';
import 'package:projetopet/common/constants/widgets/primary_button.dart';
import 'package:projetopet/features/Login/register_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: AppColors.orangeGradient,
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 40.0),
                Text(
                  "Receita na Mão",
                  style: AppTextStyles.sloganText.copyWith(
                    color: AppColors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 5.0),
                Expanded(
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 500,
                          height: 500,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                        ClipOval(
                          child: Image.asset(
                            "assets/Image/onboarding_picture.png",
                            width: 500,
                            height: 500,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //Text(
                //"Ta com fome e não sabe o que fazer?",
                //textAlign: TextAlign.center,
                //style: AppTextStyles.sloganText.copyWith(
                //color: AppColors.white,
                ///fontSize: 30,
                //),
                //),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: PrimaryButton(
                    text: "Vamos Começar",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 60.0),
                CustomLoginButton(),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
