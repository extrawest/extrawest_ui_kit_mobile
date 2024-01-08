import 'package:extrawest_ui_kit/components/widgets/ew_base_button.dart';
import 'package:extrawest_ui_kit/components/widgets/logo.dart';
import 'package:extrawest_ui_kit/components/widgets/text_widgets/text_scales.dart';
import 'package:extrawest_ui_kit/layouts/layout_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

class EnterCode extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onCodeSubmitted;
  final Function(String?)? onCodeChanged;
  final VoidCallback? onSubmit;
  final Logo? logo;
  final int codeLength;

  const EnterCode({
    this.codeLength = 4,
    this.controller,
    this.onCodeChanged,
    this.onCodeSubmitted,
    this.onSubmit,
    this.logo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutWrapper(
      contentPadding: const EdgeInsets.symmetric(horizontal: 44),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (logo != null) ...[
            logo!,
          ],
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Enter code from e-mail',
                  style: context.textStyle(
                    TextScale.titleLarge,
                  ),
                ),
                const SizedBox(height: 16),
                PinFieldAutoFill(
                  controller: controller,
                  codeLength: codeLength,
                  onCodeSubmitted: onCodeSubmitted,
                  onCodeChanged: onCodeChanged,
                  decoration: BoxLooseDecoration(
                    radius: const Radius.circular(4.0),
                    gapSpace: 16.0,
                    strokeColorBuilder: FixedColorBuilder(
                      Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                EWBaseButton.filled(
                  title: 'Submit',
                  onPressed: onSubmit,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
