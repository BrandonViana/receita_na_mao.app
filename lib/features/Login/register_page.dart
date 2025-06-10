import 'package:flutter/material.dart';
import 'package:receitanamao/common/constants/app_colors.dart';
import 'package:receitanamao/common/constants/app_text_styles.dart';
import 'package:receitanamao/common/constants/widgets/custom_border.dart';
import 'package:receitanamao/common/constants/widgets/password_field.dart';
import 'package:receitanamao/common/constants/widgets/second_button.dart';
import 'package:receitanamao/features/Login/login_page.dart';
import 'package:receitanamao/features/servicos/authentication_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController(); // NOVO
  bool isChecked = false;

  final AuthenticationService _autenservi = AuthenticationService();

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose(); // NOVO
    super.dispose();
  }

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
                          style: AppTextStyles.textAll.copyWith(
                            color: AppColors.white,
                            fontSize: 35,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nameController,
                          decoration: CustomBorder.build("Nome"),
                          keyboardType: TextInputType.name,
                          style: TextStyle(color: AppColors.white),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "O nome não pode ser vazio";
                            }
                            if (RegExp(
                              r'[^a-zA-ZáéíóúàèìòùâêîôûãõçÁÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕÇ ]',
                            ).hasMatch(value)) {
                              return 'Não pode conter números nem caracteres especiais';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _emailController,
                          decoration: CustomBorder.build('Email'),
                          keyboardType:
                              TextInputType
                                  .emailAddress, // Pequena correção aqui
                          style: TextStyle(color: AppColors.white),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'O email não pode ser vazio';
                            }
                            if (!RegExp(
                              r'^[^@]+@[^@]+\.[^@]+',
                            ).hasMatch(value)) {
                              return 'Digite um email válido';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        PasswordField(
                          label: 'Senha',
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'A senha não pode ser vazia';
                            }
                            if (value.length < 8) {
                              return 'A senha deve ter pelo menos 8 caracteres';
                            }
                            if (!RegExp(r'[A-Z]').hasMatch(value)) {
                              return 'A senha deve conter pelo menos 1 letra maiúscula';
                            }
                            if (!RegExp(
                              r'[!@#\$%^&*(),.?":{}|<>]',
                            ).hasMatch(value)) {
                              return 'A senha deve conter pelo menos 1 caractere especial';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        PasswordField(
                          label: 'Confirmar Senha',
                          controller: _confirmPasswordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Confirme sua senha';
                            }
                            if (value != _passwordController.text) {
                              return 'As senhas não coincidem';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
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
                      onPressed: () async {
                        if (!_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Formulário inválido. Corrija os erros e tente novamente.',
                              ),
                            ),
                          );
                          return;
                        }
                        if (!isChecked) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Você precisa aceitar a Política de Privacidade',
                              ),
                            ),
                          );
                          return;
                        }
                        final name = _nameController.text;
                        final email = _emailController.text;
                        final password = _passwordController.text;
                        final navigator = Navigator.of(context);
                        final messenger = ScaffoldMessenger.of(context);

                        final success = await _autenservi.registerUser(
                          name: name,
                          email: email,
                          password: password,
                        );

                        if (!mounted) return;

                        if (success) {
                          navigator.pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        } else {
                          messenger.showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Erro ao registrar. Tente novamente.',
                              ),
                            ),
                          );
                        }
                      },
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
