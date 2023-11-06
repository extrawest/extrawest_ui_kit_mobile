import 'package:extrawest_ui_kit/components/widgets/text_widgets/label_large.dart';
import 'package:extrawest_ui_kit/consts.dart';
import 'package:flutter/material.dart';

final borderRadius = BorderRadius.circular(buttonDefaultBorderRadius);

class SecondaryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const SecondaryButton({
    required this.onTap,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      borderRadius: borderRadius,
      color: Colors.transparent,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onTap,
        child: Container(
          width: 240,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            border: Border.all(
              color: theme.colorScheme.outline,
            ),
          ),
          child: Center(
            child: LabelLarge(
              text: text,
              color: theme.colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
