import 'package:extrawest_ui_kit/components/widgets/text_widgets/text_scales.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String? title;

  const Logo({this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ColoredBox(color: theme.colorScheme.onSurfaceVariant),
        Text(
          title ?? '',
          style: context.textStyle(TextScale.headlineMedium),
        ),
      ],
    );
  }
}
