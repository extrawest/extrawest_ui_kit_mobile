import 'package:extrawest_ui_kit/components/widgets/ew_base_button.dart';
import 'package:extrawest_ui_kit/components/widgets/ew_text_field.dart';
import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  final String? hintText;

  final bool isResetPasswordEnabled;

  final VoidCallback? onPasswordRecoveryTap;
  final int errorMaxLines;

  const PasswordInput({
    this.isResetPasswordEnabled = false,
    this.errorMaxLines = 2,
    this.controller,
    this.validator,
    this.onPasswordRecoveryTap,
    this.hintText,
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EWTextField(
          controller: widget.controller,
          prefixIcon: const Icon(Icons.lock_outline),
          keyboardType: TextInputType.emailAddress,
          hintText: widget.hintText ?? 'Password',
          obscure: _isObscured,
          errorMaxLines: widget.errorMaxLines,
          suffixIcon: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(20.0),
              onTap: () => setState(() => _isObscured = !_isObscured),
              child: const Icon(Icons.visibility_outlined),
            ),
          ),
          validator: widget.validator,
        ),
        if (widget.isResetPasswordEnabled) ...[
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: EWBaseButton.text(
              onPressed: widget.onPasswordRecoveryTap,
              title: 'Password recovery',
            ),
          )
        ]
      ],
    );
  }
}
