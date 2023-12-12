import 'package:extrawest_ui_kit/components/sign_in/auth_type.dart';
import 'package:extrawest_ui_kit/components/sign_in/widgets/email_input.dart';
import 'package:extrawest_ui_kit/components/sign_in/widgets/password_input.dart';
import 'package:extrawest_ui_kit/components/sign_in/widgets/phone_number_input.dart';
import 'package:extrawest_ui_kit/components/sign_in/widgets/social_auth/apple_button.dart';
import 'package:extrawest_ui_kit/components/sign_in/widgets/social_auth/facebook_button.dart';
import 'package:extrawest_ui_kit/components/sign_in/widgets/social_auth/google_button.dart';
import 'package:extrawest_ui_kit/components/sign_in/widgets/social_auth/social_auth_provider.dart';
import 'package:extrawest_ui_kit/components/sign_in/widgets/social_auth/x_button.dart';
import 'package:extrawest_ui_kit/components/widgets/ew_base_button.dart';
import 'package:extrawest_ui_kit/components/widgets/logo.dart';
import 'package:extrawest_ui_kit/components/widgets/text_widgets/text_scales.dart';
import 'package:extrawest_ui_kit/layouts/sign_in_layout.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  final AuthType authType;
  final TextEditingController? emailController;
  final TextEditingController? phoneNumberController;
  final TextEditingController? passwordController;

  final String? Function(String?)? passwordValidator;
  final String? Function(String?)? emailValidator;
  final String? Function(String?)? phoneNumberValidator;

  final String? title;
  final bool isResetPasswordEnabled;
  final bool isSignUpEnabled;
  final bool isGuestEnabled;

  final List<SocialAuthProvider> socialAuthProviders;

  final EdgeInsets? contentPadding;
  final bool useSafeArea;

  const SignIn({
    required this.authType,
    this.isResetPasswordEnabled = false,
    this.isSignUpEnabled = false,
    this.isGuestEnabled = false,
    this.useSafeArea = true,
    this.socialAuthProviders = const [],
    this.emailController,
    this.passwordController,
    this.phoneNumberController,
    this.emailValidator,
    this.passwordValidator,
    this.phoneNumberValidator,
    this.contentPadding,
    this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInLayout(
      contentPadding: contentPadding,
      useSafeArea: useSafeArea,
      child: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Logo(title: title),
                  const Spacer(),
                  Text(
                    'Sign In',
                    style: context.textStyle(TextScale.titleLarge),
                  ),
                  const SizedBox(height: 40),
                  if (authType.isEmailPassword || authType.isEmailLink)
                    EmailInput(
                      controller: emailController,
                      validator: emailValidator,
                    ),
                  if (authType.isPhoneNumber) const PhoneNumberInput(),
                  const SizedBox(height: 16),
                  if (authType.isEmailPassword || authType.isPhoneNumber) ...[
                    PasswordInput(
                      controller: passwordController,
                      validator: passwordValidator,
                      isResetPasswordEnabled: isResetPasswordEnabled,
                    ),
                    const SizedBox(height: 32),
                  ],
                  IntrinsicWidth(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        EWBaseButton.filled(onPressed: () {}, title: 'Sign In'),
                        if (isGuestEnabled) ...[
                          const SizedBox(height: 16),
                          EWBaseButton.outlined(onPressed: () {}, title: 'Sign In as Guest'),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  if (socialAuthProviders.isNotEmpty) ...[
                    _buildAuthProvider(context),
                    const SizedBox(height: 24),
                  ],
                  if (isSignUpEnabled)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: context.textStyle(TextScale.bodyMedium),
                        ),
                        EWBaseButton.text(
                          onPressed: () {},
                          title: 'Create an account',
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAuthProvider(BuildContext context) {
    final showTitle = socialAuthProviders.length < 3;
    final List<Widget> buttons = [];

    for (int i = 0; i <= socialAuthProviders.length - 1; i++) {
      buttons.add(buildSocialButton(socialAuthProviders[i], showTitle));

      if (i < socialAuthProviders.length - 1) {
        buttons.add(const SizedBox(width: 16));
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: buttons,
    );
  }

  Widget buildSocialButton(SocialAuthProvider social, bool showTitle) {
    return switch (social) {
      SocialAuthProvider.google => GoogleButton(
          onTap: () {},
          showTitle: showTitle,
        ),
      SocialAuthProvider.appleId => AppleButton(
          onTap: () {},
          showTitle: showTitle,
        ),
      SocialAuthProvider.facebook => FacebookButton(
          onTap: () {},
          showTitle: showTitle,
        ),
      SocialAuthProvider.x => XButton(
          onTap: () {},
          showTitle: showTitle,
        ),
    };
  }
}
