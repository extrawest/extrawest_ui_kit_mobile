import 'package:extrawest_ui_kit/components/widgets/ew_base_button.dart';
import 'package:extrawest_ui_kit/components/widgets/ew_text_field.dart';
import 'package:extrawest_ui_kit/components/widgets/text_widgets/text_scales.dart';
import 'package:extrawest_ui_kit/layouts/layout_wrapper.dart';
import 'package:flutter/material.dart';

class OTPEnterPhone extends StatelessWidget {
  final VoidCallback onSendPressed;
  final TextEditingController controller;

  const OTPEnterPhone({
    required this.onSendPressed,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutWrapper(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Placeholder(
            child: SizedBox(
              height: 200,
              width: 200,
              child: Center(child: Text('Mascot')),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Enter your phone number and we will send you a OTP code for verification',
              style: context.textStyle(TextScale.bodyMedium),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),
          // TODO(roman.ovsepian) Replace with PhoneNumberInput
          const EWTextField(
            hintText: 'Phone Number',
          ),
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
