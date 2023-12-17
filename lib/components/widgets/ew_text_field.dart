import 'package:flutter/material.dart';

class EWTextField extends StatelessWidget {
  final TextInputType? keyboardType;
  final TextStyle? textStyle;
  final String? Function(String?)? validator;
  final String? hintText;
  final String? errorText;
  final Widget? prefixIcon;
  final bool obscure;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final Color? cursorColor;
  final AutovalidateMode autoValidateMode;

  const EWTextField({
    this.obscure = false,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.controller,
    this.keyboardType,
    this.textStyle,
    this.validator,
    this.hintText,
    this.prefixIcon,
    this.errorText,
    this.cursorColor,
    this.suffixIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: theme.inputDecorationTheme.focusedBorder,
        errorBorder: theme.inputDecorationTheme.errorBorder,
        labelText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        errorText: errorText,
      ),
      cursorColor: cursorColor,
      style: textStyle,
      autovalidateMode: autoValidateMode,
      keyboardType: keyboardType,
      validator: validator,
      obscureText: obscure,
    );
  }
}
