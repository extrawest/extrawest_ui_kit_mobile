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
      onTap: onTap,
      icon: const Icon(Icons.facebook_outlined, color: Colors.blue),
      title: 'Facebook',
      showTitle: showTitle,
    );
  }
}
