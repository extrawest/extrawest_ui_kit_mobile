import 'package:extrawest_ui_kit/components/widgets/ew_text_field.dart';
import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const EmailInput({
    this.controller,
    this.validator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EWTextField(
      controller: controller,
      prefixIcon: const Icon(Icons.email_outlined),
      keyboardType: TextInputType.emailAddress,
      hintText: 'Email',
      validator: validator,
    );
  }
}
