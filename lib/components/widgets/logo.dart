import 'package:extrawest_ui_kit/components/widgets/text_widgets/text_scales.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String? title;
  final String? iconPath;

  const Logo({
    this.iconPath,
    this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (iconPath != null) ...[
          Image.asset(iconPath!),
          const SizedBox(width: 4),
        ],
        Text(
          title ?? '',
          style: context.textStyle(TextScale.headlineLarge),
        ),
      ],
    );
  }
}
