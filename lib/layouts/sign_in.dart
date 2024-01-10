import 'package:extrawest_ui_kit/components/sign_in/auth_type.dart';
import 'package:extrawest_ui_kit/components/sign_in/widgets/email_input.dart';
import 'package:extrawest_ui_kit/components/sign_in/widgets/password_input.dart';
import 'package:extrawest_ui_kit/components/sign_in/widgets/social_auth/apple_button.dart';
import 'package:extrawest_ui_kit/components/sign_in/widgets/social_auth/facebook_button.dart';
import 'package:extrawest_ui_kit/components/sign_in/widgets/social_auth/google_button.dart';
import 'package:extrawest_ui_kit/components/sign_in/widgets/social_auth/social_auth_provider.dart';
import 'package:extrawest_ui_kit/components/sign_in/widgets/social_auth/x_button.dart';
import 'package:extrawest_ui_kit/components/widgets/ew_base_button.dart';
import 'package:extrawest_ui_kit/components/widgets/logo.dart';
import 'package:extrawest_ui_kit/components/widgets/text_widgets/text_scales.dart';
import 'package:extrawest_ui_kit/layouts/layout_wrapper.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  /// Choose here what auth type you would like to use for signing in
  final AuthType authType;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  final void Function()? onCreateAccountTap;
  final void Function()? onSignInTap;
  final void Function()? onSignInAsGuestTap;
  final void Function()? onPasswordRecoveryTap;

  /// Here you can use either the package's [Logo] component, either custom one
  final Widget? logo;
  final bool isResetPasswordEnabled;
  final bool isSignUpEnabled;
  final bool isGuestEnabled;

  final List<SocialAuthProviderElement> socialAuthProviders;

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
    this.contentPadding,
    this.logo,
    this.onCreateAccountTap,
    this.onSignInTap,
    this.onSignInAsGuestTap,
    this.onPasswordRecoveryTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutWrapper(
      contentPadding: contentPadding,
      useSafeArea: useSafeArea,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: logo),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Sign In',
                    style: context.textStyle(TextScale.titleLarge),
                  ),
                  const SizedBox(height: 40),
                  if (authType.isEmailPassword || authType.isEmailLink)
                    EmailInput(
                      controller: emailController,
                    ),
                  const SizedBox(height: 16),
                  if (authType.isEmailPassword || authType.isPhoneNumber) ...[
                    PasswordInput(
                      controller: passwordController,
                      isResetPasswordEnabled: isResetPasswordEnabled,
                      onPasswordRecoveryTap: onPasswordRecoveryTap,
                    ),
                    const SizedBox(height: 32),
                  ],
                  IntrinsicWidth(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        EWBaseButton.filled(onPressed: onSignInTap, title: 'Sign In'),
                        if (isGuestEnabled) ...[
                          const SizedBox(height: 16),
                          EWBaseButton.outlined(onPressed: onSignInAsGuestTap, title: 'Sign In as Guest'),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  if (socialAuthProviders.isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: _buildAuthProvider(context),
                    ),
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
                          onPressed: onCreateAccountTap,
                          title: 'Create an account',
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAuthProvider(BuildContext context) {
    final showTitle = socialAuthProviders.length < 3;
    final List<Widget> socialButtons = [];

    print('');
    socialAuthProviders.asMap().forEach((index, social) {
      socialButtons.add(buildSocialButton(social, showTitle));
      if (index < socialAuthProviders.length - 1) {
        socialButtons.add(const SizedBox(width: 16));
      }
    });

    return Wrap(
      alignment: WrapAlignment.center,
      children: socialButtons,
    );
  }

  Widget buildSocialButton(SocialAuthProviderElement social, bool showTitle) {
    return switch (social.socialAuthProvider) {
      SocialAuthProvider.google => GoogleButton(
          onTap: social.onTap,
          showTitle: showTitle,
        ),
      SocialAuthProvider.appleId => AppleButton(
          onTap: social.onTap,
          showTitle: showTitle,
        ),
      SocialAuthProvider.facebook => FacebookButton(
          onTap: social.onTap,
          showTitle: showTitle,
        ),
      SocialAuthProvider.x => XButton(
          onTap: social.onTap,
          showTitle: showTitle,
        ),
    };
  }
}
