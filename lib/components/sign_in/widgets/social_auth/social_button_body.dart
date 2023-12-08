import 'package:extrawest_ui_kit/components/widgets/ew_base_button.dart';
import 'package:extrawest_ui_kit/consts.dart';
import 'package:flutter/material.dart';

class SocialButtonBody extends StatelessWidget {
  final BorderRadius borderRadius = BorderRadius.circular(buttonDefaultBorderRadius);
  final VoidCallback onTap;
  final bool showTitle;
  final String title;
  final Widget icon;

  SocialButtonBody({
    required this.onTap,
    required this.icon,
    this.showTitle = true,
    this.title = '',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EWBaseButton.outlined(
      showTitle: showTitle,
      icon: icon,
      title: title,
      onPressed: onTap,
    );
  }
}
