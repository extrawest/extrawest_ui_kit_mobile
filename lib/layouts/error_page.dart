import 'package:extrawest_ui_kit/components/widgets/ew_base_button.dart';
import 'package:extrawest_ui_kit/components/widgets/text_widgets/text_scales.dart';
import 'package:extrawest_ui_kit/consts.dart';
import 'package:extrawest_ui_kit/layouts/layout_wrapper.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String title;
  final String contentText;
  final Widget? logo;
  final VoidCallback? onRetryPressed;
  final VoidCallback? onBackPressed;

  const ErrorPage({
    this.title = 'Page not found',
    this.contentText = errorPageDefaultContentText,
    this.logo,
    this.onRetryPressed,
    this.onBackPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutWrapper(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (logo != null) ...[
            logo!,
            const SizedBox(height: 16),
            Text(
              title,
              style: context.textStyle(TextScale.titleLarge),
            ),
            const SizedBox(height: 16),
            Text(
              contentText,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            EWBaseButton.filled(
              title: 'Retry',
              onPressed: onRetryPressed,
            ),
            const SizedBox(height: 16),
            EWBaseButton.outlined(
              title: 'Back',
              onPressed: onBackPressed,
            ),
          ],
        ],
      ),
    );
  }
}
