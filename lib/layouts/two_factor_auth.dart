import 'package:extrawest_ui_kit/components/widgets/ew_base_button.dart';
import 'package:extrawest_ui_kit/components/widgets/ew_text_field.dart';
import 'package:extrawest_ui_kit/components/widgets/text_widgets/text_scales.dart';
import 'package:extrawest_ui_kit/layouts/layout_wrapper.dart';
import 'package:flutter/material.dart';

/// Layout for entering 2FA Auth code
class TwoFactorAuth extends StatelessWidget {
  final VoidCallback onSendPressed;
  final TextEditingController controller;

  /// Here you can use either the package's [Logo] component, either custom one
  final Widget? logo;

  const TwoFactorAuth({
    required this.onSendPressed,
    required this.controller,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Enter code from 2FA authorization app',
              style: context.textStyle(TextScale.bodyMedium),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),
          const EWTextField(
            hintText: 'Code from 2FA app',
            prefixIcon: Icon(Icons.keyboard_alt_outlined),
          ),
          const SizedBox(height: 16),
          EWBaseButton.filled(
            onPressed: onSendPressed,
            title: 'Send',
          ),
        ],
      ),
    );
  }
}
