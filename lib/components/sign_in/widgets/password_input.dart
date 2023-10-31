import 'package:extrawest_ui_kit/components/widgets/common_text_field.dart';
import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const PasswordInput({
    this.controller,
    this.validator,
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      controller: widget.controller,
      prefixIcon: const Icon(Icons.lock_outline),
      keyboardType: TextInputType.emailAddress,
      hintText: 'Password',
      obscure: _isObscured,
      suffixIcon: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(20.0),
          onTap: () => setState(() => _isObscured = !_isObscured),
          child: Icon(
            Icons.visibility_outlined,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ),
      validator: widget.validator,
    );
  }
}
