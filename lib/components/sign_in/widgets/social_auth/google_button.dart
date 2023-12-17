import 'package:extrawest_ui_kit/components/sign_in/widgets/social_auth/social_auth_button.dart';
import 'package:extrawest_ui_kit/components/sign_in/widgets/social_auth/social_button_body.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoogleButton extends SocialAuthButton {
  const GoogleButton({
    required super.onTap,
    super.showTitle = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SocialButtonBody(
      onTap: onTap,
      icon: const Icon(FontAwesomeIcons.google),
      title: 'Google',
      showTitle: showTitle,
    );
  }
}
