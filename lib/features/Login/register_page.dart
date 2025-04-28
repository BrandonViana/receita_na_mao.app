import 'package:flutter/material.dart';
import 'package:projetopet/common/constants/app_colors.dart';
import 'package:projetopet/common/constants/app_text_styles.dart';
import 'package:projetopet/common/constants/widgets/custom_border.dart';
import 'package:projetopet/common/constants/widgets/password_field.dart';
import 'package:projetopet/common/constants/widgets/second_button.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:projetopet/features/Login/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isChecked = false;

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
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          'Criar Conta',
                          style: AppTextStyles.simpleText.copyWith(
                            color: AppColors.white,
                            fontSize: 35,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    decoration: CustomBorder.build(
                      "Nome",
                    ).copyWith(hintText: "Roberto Pêra"),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: CustomBorder.build(
                      'Telefone',
                    ).copyWith(hintText: "(xx) xxxx-xxxx"),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: CustomBorder.build(
                      'Email',
                    ).copyWith(hintText: "email@email.com"),
                  ),
                  const SizedBox(height: 20),
                  PasswordField(label: 'Senha'),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            isChecked = newValue!;
                          });
                        },
                        fillColor: WidgetStateProperty.resolveWith<Color>(
                          (Set<WidgetState> states) => AppColors.orange,
                        ),
                        checkColor: AppColors.white,
                        side: BorderSide(color: AppColors.white, width: 2),
                      ),
                      Expanded(
                        child: Text(
                          'Concordo com a Política de Privacidade',
                          style: AppTextStyles.simpleText.copyWith(
                            fontSize: 14,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SecondButton(
                      text: "Registrar",
                      onPressed: () {
                        if (isChecked) {
                          // Verifica se o checkbox está marcado
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Você precisa aceitar a Política de Privacidade.',
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SignInButton(
                          Buttons.GoogleDark,
                          text: "Entrar com Google",
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
