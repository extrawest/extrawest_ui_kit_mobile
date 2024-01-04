import 'package:extrawest_ui_kit/components/sign_in/widgets/email_input.dart';
import 'package:extrawest_ui_kit/components/widgets/ew_base_button.dart';
import 'package:extrawest_ui_kit/components/widgets/text_widgets/text_scales.dart';
import 'package:extrawest_ui_kit/layouts/layout_wrapper.dart';
import 'package:flutter/material.dart';

class PasswordRecovery extends StatelessWidget {
  final VoidCallback onSendPressed;
  final TextEditingController emailController;
  final Widget? logo;

  const PasswordRecovery({
    required this.onSendPressed,
    required this.emailController,
    this.logo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutWrapper(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (logo != null) ...[
            logo!,
            const SizedBox(height: 40),
          ],
          Text(
            'Password recovery',
            style: context.textStyle(TextScale.titleLarge),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Enter your email and we will send you a link to change your password',
              style: context.textStyle(TextScale.bodyMedium),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),
          EmailInput(controller: emailController),
          const SizedBox(height: 16),
          EWBaseButton.filled(
            onPressed: onSendPressed,
            title: 'Send link',
          ),
        ],
      ),
    );
  }
}
