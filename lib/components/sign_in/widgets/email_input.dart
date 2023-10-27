import 'package:extrawest_ui_kit/components/widgets/common_text_field.dart';
import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CommonTextField(
      prefixIcon: Icon(Icons.email),
      keyboardType: TextInputType.emailAddress,
      hintText: 'Email',
    );
  }
}
