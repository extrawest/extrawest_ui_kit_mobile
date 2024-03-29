import 'package:extrawest_ui_kit/components/widgets/ew_base_button.dart';
import 'package:extrawest_ui_kit/components/widgets/text_widgets/text_scales.dart';
import 'package:extrawest_ui_kit/layouts/layout_wrapper.dart';
import 'package:flutter/material.dart';

/// This layout can be used to show that password recovery email is successfully sent
class EmailSent extends StatelessWidget {
  final VoidCallback? onOpenEmailPressed;
  final VoidCallback? onTryAnotherEmailPressed;
  final String email;

  /// Here you can use either the package's [Logo] component, either custom one
  final Widget? logo;

  const EmailSent({
    required this.email,
    this.onOpenEmailPressed,
    this.onTryAnotherEmailPressed,
    this.logo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutWrapper(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          if (logo != null) ...[
            logo!,
            const SizedBox(height: 40),
          ],
          const SizedBox(height: 40),
          Text(
            'Email sent to',
            style: context.textStyle(TextScale.titleLarge),
          ),
          const SizedBox(height: 8),
          Text(
            email,
            style: context.textStyle(
              TextScale.titleMedium,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Text(
              'Check your email and open the link we sent to continue',
              style: context.textStyle(TextScale.bodyMedium),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),
          EWBaseButton.filled(
            onPressed: onOpenEmailPressed,
            title: 'Open email',
          ),
          const SizedBox(height: 40),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Text(
              'Did not receive the email? Check your spam filter, or',
              style: context.textStyle(TextScale.bodyMedium),
              textAlign: TextAlign.center,
            ),
          ),
          EWBaseButton.text(
            title: 'Try another email',
            onPressed: onTryAnotherEmailPressed,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
