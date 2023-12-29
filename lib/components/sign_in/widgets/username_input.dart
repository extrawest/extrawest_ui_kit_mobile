import 'package:extrawest_ui_kit/components/widgets/ew_text_field.dart';
import 'package:flutter/material.dart';

class UsernameInput extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String? hintText;

  const UsernameInput({
    this.controller,
    this.validator,
    this.hintText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EWTextField(
      controller: controller,
      prefixIcon: const Icon(Icons.account_circle_outlined),
      keyboardType: TextInputType.emailAddress,
      hintText: hintText ?? 'Username',
      validator: validator,
    );
  }
}
