import 'package:flutter/material.dart';
import 'package:receitanamao/common/constants/app_colors.dart';
import 'package:receitanamao/common/constants/widgets/custom_border.dart';

class PasswordField extends StatefulWidget {
  final String label;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;

  const PasswordField({
    super.key,
    required this.label,
    this.validator,
    this.controller,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() => _obscureText = !_obscureText);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: CustomBorder.build(widget.label).copyWith(
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: AppColors.white,
          ),
          onPressed: _toggleVisibility,
        ),
      ),
      style: const TextStyle(color: AppColors.white),
      validator: widget.validator,
    );
  }
}
