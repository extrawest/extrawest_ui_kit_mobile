import 'package:flutter/material.dart';

class CommonTextField extends StatefulWidget {
  final TextInputType? keyboardType;
  final TextStyle? textStyle;
  final String? Function(String?)? validator;
  final String? hintText;
  final Widget? prefixIcon;
  final bool obscure;
  final Widget? suffixIcon;

  const CommonTextField({
    this.keyboardType,
    this.textStyle,
    this.validator,
    this.hintText,
    this.prefixIcon,
    this.obscure = false,
    this.suffixIcon,
    Key? key,
  }) : super(key: key);

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      controller: _textController,
      decoration: InputDecoration(
        border: theme.inputDecorationTheme.border,
        focusedBorder: theme.inputDecorationTheme.focusedBorder,
        errorBorder: theme.inputDecorationTheme.errorBorder,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
      ),
      cursorColor: theme.colorScheme.primary,
      style: widget.textStyle,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      obscureText: widget.obscure,
    );
  }
}
