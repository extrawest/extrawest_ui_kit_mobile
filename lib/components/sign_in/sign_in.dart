import 'package:extrawest_ui_kit/components/sign_in/widgets/email_input.dart';
import 'package:extrawest_ui_kit/components/sign_in/widgets/password_input.dart';
import 'package:extrawest_ui_kit/components/sign_in/widgets/phone_number_input.dart';
import 'package:extrawest_ui_kit/components/sign_in/widgets/social_auth/apple_button.dart';
import 'package:extrawest_ui_kit/components/sign_in/widgets/social_auth/facebook_button.dart';
import 'package:extrawest_ui_kit/components/sign_in/widgets/social_auth/google_button.dart';
import 'package:extrawest_ui_kit/components/sign_in/widgets/social_auth/social_auth_button.dart';
import 'package:extrawest_ui_kit/components/sign_in/widgets/social_auth/x_button.dart';
import 'package:extrawest_ui_kit/components/widgets/common_button.dart';
import 'package:extrawest_ui_kit/components/widgets/secondary_button.dart';
import 'package:extrawest_ui_kit/components/widgets/text_widgets/body_medium.dart';
import 'package:extrawest_ui_kit/components/widgets/text_widgets/label_large.dart';
import 'package:extrawest_ui_kit/components/widgets/text_widgets/title_large.dart';
import 'package:flutter/material.dart';

enum AuthType {
  emailLink,
  emailPassword,
  phoneNumber;

  bool get isEmailLink => this == emailLink;

  bool get isEmailPassword => this == emailPassword;

  bool get isPhoneNumber => this == phoneNumber;
}

class SignInLayout extends StatelessWidget {
  final Widget child;

  const SignInLayout({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: child,
        ),
      ),
    );
  }
}

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

  final List<SocialAuthProviders> socialAuthProviders;

  const SignIn({
    required this.authType,
    this.emailController,
    this.isResetPasswordEnabled = false,
    this.isSignUpEnabled = false,
    this.isGuestEnabled = false,
    this.passwordController,
    this.phoneNumberController,
    this.emailValidator,
    this.passwordValidator,
    this.phoneNumberValidator,
    this.socialAuthProviders = const [],
    this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SignInLayout(
      child: Column(
        children: [
          _Logo(title: title),
          const Spacer(),
          const TitleLarge(text: 'Sign In'),
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
          CommonButton(onTap: () {}, text: 'Sign In'),
          if (isGuestEnabled) ...[
            const SizedBox(height: 16),
            SecondaryButton(onTap: () {}, text: 'Sign In as Guest'),
          ],
          const SizedBox(height: 40),
          if (socialAuthProviders.isNotEmpty) ...[
            _buildAuthProvider(context),
            const SizedBox(height: 24),
          ],
          if (isSignUpEnabled)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const BodyMedium(text: "Don't have an account?"),
                Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20.0),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: LabelLarge(
                        text: 'Create an account',
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildAuthProvider(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...socialAuthProviders.map(
          (social) {
            final isLabelVisible = socialAuthProviders.length < 3;
            Widget provider;
            switch (social) {
              case SocialAuthProviders.google:
                provider = GoogleButton(
                  onTap: () {},
                  isLabelVisible: isLabelVisible,
                );
              case SocialAuthProviders.appleId:
                provider = AppleButton(
                  onTap: () {},
                  isLabelVisible: isLabelVisible,
                );
              case SocialAuthProviders.facebook:
                provider = FacebookButton(
                  onTap: () {},
                  isLabelVisible: isLabelVisible,
                );
              case SocialAuthProviders.x:
                provider = XButton(
                  onTap: () {},
                  isLabelVisible: isLabelVisible,
                );
            }
            return Expanded(
              child: Row(
                children: [
                  isLabelVisible ? Expanded(child: provider) : provider,
                  const SizedBox(width: 16),
                ],
              ),
            );
          },
        ).toList(),
      ],
    );
  }
}

class _Logo extends StatelessWidget {
  final String? title;

  const _Logo({this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(color: Colors.yellow),
        Text(
          title ?? '',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );
  }
}
