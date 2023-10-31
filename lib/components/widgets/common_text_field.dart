import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final TextInputType? keyboardType;
  final TextStyle? textStyle;
  final String? Function(String?)? validator;
  final String? hintText;
  final String? errorText;
  final Widget? prefixIcon;
  final bool obscure;
  final Widget? suffixIcon;
  final TextEditingController? controller;

  const CommonTextField({
    this.controller,
    this.keyboardType,
    this.textStyle,
    this.validator,
    this.hintText,
    this.prefixIcon,
    this.errorText,
    this.obscure = false,
    this.suffixIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: (theme.inputDecorationTheme.focusedBorder as OutlineInputBorder).copyWith(
          borderSide: BorderSide(color: theme.colorScheme.primary, width: 2),
        ),
        errorBorder: (theme.inputDecorationTheme.errorBorder as OutlineInputBorder)
            .copyWith(borderSide: BorderSide(color: theme.colorScheme.error)),
        labelText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        errorText: errorText,
      ),
      cursorColor: theme.colorScheme.primary,
      style: textStyle,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      validator: validator,
      obscureText: obscure,
    );
  }
}
