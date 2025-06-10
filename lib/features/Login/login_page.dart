import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:receitanamao/common/constants/app_colors.dart';
import 'package:receitanamao/common/constants/app_text_styles.dart';
import 'package:receitanamao/common/constants/widgets/custom_border.dart';
import 'package:receitanamao/common/constants/widgets/password_field.dart';
import 'package:receitanamao/common/constants/widgets/second_button.dart';
import 'package:receitanamao/features/Login/forgot_password_page.dart';
import 'package:receitanamao/features/pages/first_page.dart';
import 'package:receitanamao/features/Login/register_page.dart';
import 'package:receitanamao/features/servicos/authentication_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthenticationService _authService = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: AppColors.orangeGradient,
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
        child: Align(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/Image/login_page_chef.png",
                  height: 320,
                  width: 320,
                ),
                Text(
                  'Login',
                  style: AppTextStyles.textAll.copyWith(
                    color: AppColors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: CustomBorder.build('Email'),
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: AppColors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Digite seu email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Email inválido';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      PasswordField(
                        controller: _passwordController,
                        label: 'Senha',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Digite sua senha';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
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
                                            builder: (context) => ForgotPasswordPage(),
                                          ),
                                        );
                                      },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      SecondButton(
                        text: 'Entrar',
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final navigator = Navigator.of(context);
                            final messenger = ScaffoldMessenger.of(context);

                            final String? errorMessage = await _authService
                                .logUser(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                );

                            if (!mounted) return;

                            if (errorMessage == null) {
                              // Login bem-sucedido
                              navigator.pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const FirstPage(),
                                ),
                              );
                            } else {
                              // Erro no login
                              messenger.showSnackBar(
                                SnackBar(content: Text(errorMessage)),
                              );
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: RichText(
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
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
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
