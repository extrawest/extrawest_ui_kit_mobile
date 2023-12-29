import 'package:extrawest_ui_kit/components/sign_in/widgets/email_input.dart';
import 'package:extrawest_ui_kit/components/sign_in/widgets/password_input.dart';
import 'package:extrawest_ui_kit/components/sign_in/widgets/social_auth/apple_button.dart';
import 'package:extrawest_ui_kit/components/sign_in/widgets/social_auth/facebook_button.dart';
import 'package:extrawest_ui_kit/components/sign_in/widgets/social_auth/google_button.dart';
import 'package:extrawest_ui_kit/components/sign_in/widgets/social_auth/social_auth_provider.dart';
import 'package:extrawest_ui_kit/components/sign_in/widgets/social_auth/x_button.dart';
import 'package:extrawest_ui_kit/components/sign_in/widgets/username_input.dart';
import 'package:extrawest_ui_kit/components/widgets/ew_base_button.dart';
import 'package:extrawest_ui_kit/components/widgets/logo.dart';
import 'package:extrawest_ui_kit/components/widgets/text_widgets/text_scales.dart';
import 'package:extrawest_ui_kit/layouts/sign_in_layout.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatelessWidget {
  final TextEditingController? emailController;
  final TextEditingController? phoneNumberController;
  final TextEditingController? passwordController;

  final String? Function(String?)? passwordValidator;
  final String? Function(String?)? emailValidator;
  final String? Function(String?)? phoneNumberValidator;

  final void Function()? onCreateAccountTap;
  final void Function()? onSignUpTap;
  final void Function()? onPasswordRecoveryTap;
  final void Function()? onPrivacyPolicyTap;
  final void Function()? onTermsAndConditionTap;

  final String? title;
  final bool isSignInEnabled;
  final AutovalidateMode autoValidateMode;

  final bool isEmailEnabled;
  final bool isUsernameEnabled;
  final bool isPasswordEnabled;

  final List<SocialAuthProviderElement> socialAuthProviders;

  final EdgeInsets? contentPadding;
  final bool useSafeArea;

  const CreateAccount({
    this.isSignInEnabled = false,
    this.isUsernameEnabled = false,
    this.isEmailEnabled = true,
    this.isPasswordEnabled = false,
    this.useSafeArea = true,
    this.socialAuthProviders = const [],
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.emailController,
    this.passwordController,
    this.phoneNumberController,
    this.emailValidator,
    this.passwordValidator,
    this.phoneNumberValidator,
    this.contentPadding,
    this.title,
    this.onCreateAccountTap,
    this.onSignUpTap,
    this.onPasswordRecoveryTap,
    this.onPrivacyPolicyTap,
    this.onTermsAndConditionTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInLayout(
      contentPadding: contentPadding,
      useSafeArea: useSafeArea,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: Logo(title: title)),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Create Account',
                    style: context.textStyle(TextScale.titleLarge),
                  ),
                  const SizedBox(height: 40),
                  if (isEmailEnabled)
                    EmailInput(
                      controller: emailController,
                      validator: emailValidator,
                    ),
                  const SizedBox(height: 16),
                  if (isUsernameEnabled) ...[
                    const UsernameInput(),
                    const SizedBox(height: 16),
                  ],
                  if (isPasswordEnabled) ...[
                    PasswordInput(
                      controller: passwordController,
                      validator: passwordValidator,
                      isResetPasswordEnabled: false,
                      onPasswordRecoveryTap: onPasswordRecoveryTap,
                    ),
                    const SizedBox(height: 32),
                  ],
                  IntrinsicWidth(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        EWBaseButton.filled(onPressed: onSignUpTap, title: 'Create Account'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildApproveSection(),
                  const SizedBox(height: 32),
                  if (socialAuthProviders.isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: _buildAuthProvider(context),
                    ),
                    const SizedBox(height: 24),
                  ],
                  if (isSignInEnabled)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: context.textStyle(TextScale.bodyMedium),
                        ),
                        EWBaseButton.text(
                          onPressed: onCreateAccountTap,
                          title: 'Sign In',
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

  Widget _buildApproveSection() {
    if (onPrivacyPolicyTap == null && onTermsAndConditionTap == null) {
      return const SizedBox();
    }
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      children: [
        const Text(
          'By proceeding you agree with',
          textAlign: TextAlign.start,
        ),
        if (onPrivacyPolicyTap != null)
          EWBaseButton.text(
            title: 'Privacy Policy',
            onPressed: onPrivacyPolicyTap,
          ),
        if (onPrivacyPolicyTap != null && onTermsAndConditionTap != null) const Text('and '),
        if (onTermsAndConditionTap != null) ...[
          EWBaseButton.text(
            title: 'Terms and conditions',
            onPressed: onTermsAndConditionTap,
          )
        ],
      ],
    );
  }

  Widget _buildAuthProvider(BuildContext context) {
    final showTitle = socialAuthProviders.length < 3;
    final List<Widget> socialButtons = [];

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
