import 'package:extrawest_ui_kit/components/widgets/text_widgets/label_large.dart';
import 'package:extrawest_ui_kit/consts.dart';
import 'package:flutter/material.dart';

class SocialButtonBody extends StatelessWidget {
  final BorderRadius borderRadius = BorderRadius.circular(buttonDefaultBorderRadius);
  final VoidCallback onTap;
  final bool isLabelVisible;
  final String label;
  final Widget icon;

  SocialButtonBody({
    required this.onTap,
    required this.icon,
    this.isLabelVisible = true,
    this.label = '',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      borderRadius: isLabelVisible ? borderRadius : null,
      type: isLabelVisible ? MaterialType.canvas : MaterialType.circle,
      child: InkWell(
        borderRadius: isLabelVisible ? borderRadius : null,
        customBorder: isLabelVisible ? null : const CircleBorder(),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 11.0, horizontal: isLabelVisible ? 0 : 11.0),
          decoration: BoxDecoration(
            borderRadius: isLabelVisible ? borderRadius : null,
            border: Border.all(
              color: theme.colorScheme.outline,
            ),
            shape: isLabelVisible ? BoxShape.rectangle : BoxShape.circle,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              if (isLabelVisible)
                LabelLarge(
                  text: label,
                  color: Theme.of(context).colorScheme.primary,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
