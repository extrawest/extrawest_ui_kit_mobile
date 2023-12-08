import 'package:extrawest_ui_kit/components/sign_in/widgets/social_auth/social_auth_button.dart';
import 'package:extrawest_ui_kit/components/sign_in/widgets/social_auth/social_button_body.dart';
import 'package:flutter/material.dart';

class FacebookButton extends SocialAuthButton {
  const FacebookButton({
    required super.onTap,
    super.showTitle = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SocialButtonBody(
      onTap: () {},
      icon: const FlutterLogo(),
      title: 'Facebook',
      showTitle: showTitle,
    );
  }
}
