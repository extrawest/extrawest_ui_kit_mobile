import 'package:flutter/cupertino.dart';

enum SocialAuthProviders {
  google,
  appleId,
  facebook,
  x,
}

abstract class SocialAuthButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isLabelVisible;

  const SocialAuthButton({
    super.key,
    required this.onTap,
    this.isLabelVisible = false,
  });
}
