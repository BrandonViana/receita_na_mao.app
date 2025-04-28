import 'package:flutter/material.dart';
import 'package:projetopet/common/constants/app_colors.dart';
import 'package:projetopet/common/constants/widgets/custom_border.dart';

class PasswordField extends StatefulWidget {
  final String label;

  const PasswordField({super.key, required this.label});

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
    return TextField(
      obscureText: _obscureText,
      decoration: CustomBorder.build(widget.label).copyWith(
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: AppColors.black,
          ),
          onPressed: _toggleVisibility,
        ),
      ),
    );
  }
}
