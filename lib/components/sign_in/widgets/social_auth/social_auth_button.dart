import 'package:flutter/cupertino.dart';

abstract class SocialAuthButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool showTitle;

  const SocialAuthButton({
    super.key,
    required this.onTap,
    this.showTitle = false,
  });
}
