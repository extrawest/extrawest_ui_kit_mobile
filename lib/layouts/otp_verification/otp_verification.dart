import 'package:extrawest_ui_kit/components/widgets/ew_base_button.dart';
import 'package:extrawest_ui_kit/components/widgets/text_widgets/text_scales.dart';
import 'package:extrawest_ui_kit/layouts/layout_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OTPVerification extends StatelessWidget {
  final VoidCallback? onVerifyPressed;
  final dynamic Function(String)? onCodeSubmitted;
  final dynamic Function(String)? onCodeChanged;
  final int? codeLength;
  final VoidCallback? onResendPressed;
  final String phoneNumber;

  const OTPVerification({
    required this.phoneNumber,
    this.onVerifyPressed,
    this.onResendPressed,
    this.onCodeSubmitted,
    this.onCodeChanged,
    this.codeLength,
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
          Text(
            'Enter the OTP sent to',
            style: context.textStyle(TextScale.titleLarge),
          ),
          const SizedBox(height: 8),
          Text(
            phoneNumber,
            style: context.textStyle(
              TextScale.titleMedium,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          TextFieldPinAutoFill(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.keyboard_alt_outlined),
              hintText: 'OTP code',
            ),
            onCodeSubmitted: onCodeSubmitted,
            onCodeChanged: onCodeChanged,
            codeLength: codeLength ?? 6,
          ),
          const SizedBox(height: 24),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                "Don't receive the OTP? ",
                style: context.textStyle(TextScale.bodyMedium),
                textAlign: TextAlign.center,
              ),
              EWBaseButton.text(
                title: 'Resend OTP',
                onPressed: onResendPressed,
              )
            ],
          ),
          const SizedBox(height: 40),
          EWBaseButton.filled(
            onPressed: onVerifyPressed,
            title: 'Verify',
          ),
        ],
      ),
    );
  }
}
