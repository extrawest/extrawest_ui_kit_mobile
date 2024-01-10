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
import 'package:extrawest_ui_kit/layouts/layout_wrapper.dart';
import 'package:extrawest_ui_kit/utils/form_validation/create_account_form_state.dart';
import 'package:extrawest_ui_kit/utils/form_validation/email_validation.dart';
import 'package:extrawest_ui_kit/utils/form_validation/password_validation.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

/// Layout for Sign Up
class CreateAccount extends StatefulWidget {
  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  /// Pass this parameter, if you want to override default email validation RegExp
  final RegExp? emailRegExp;

  /// Pass this parameter, if you want to override default email validation RegExp
  final RegExp? passwordRegExp;

  /// If you override [emailRegExp] parameter, pass here error text for your custom RegExp rules
  final String? emailInvalidText;

  /// If you override [passwordRegExp] parameter, pass here error text for your custom RegExp rules
  final String? passwordInvalidText;

  final void Function()? onCreateAccountTap;
  final void Function()? onSignUpTap;
  final void Function()? onPasswordRecoveryTap;
  final void Function()? onPrivacyPolicyTap;
  final void Function()? onTermsAndConditionTap;

  /// Here you can use either the package's [Logo] component, either custom one
  final Widget? logo;
  final bool isSignInEnabled;
  final AutovalidateMode autoValidateMode;

  /// Enables [EmailInput]
  final bool isEmailEnabled;

  /// Enables [UsernameInput]
  final bool isUsernameEnabled;

  /// Enables [PasswordInput]
  final bool isPasswordEnabled;

  /// Pass here the list of needed [SocialAuthProviderElement] objects.
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
    this.emailRegExp,
    this.passwordRegExp,
    this.emailInvalidText,
    this.passwordInvalidText,
    this.contentPadding,
    this.logo,
    this.onCreateAccountTap,
    this.onSignUpTap,
    this.onPasswordRecoveryTap,
    this.onPrivacyPolicyTap,
    this.onTermsAndConditionTap,
    Key? key,
  }) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _key = GlobalKey<FormState>();
  late CreateAccountFormState _formState;

  @override
  void initState() {
    super.initState();
    _formState = CreateAccountFormState();
    if (widget.emailController != null) {
      widget.emailController?.addListener(_onEmailChanged);
    }
    if (widget.passwordController != null) {
      widget.passwordController?.addListener(_onPasswordChanged);
    }
  }

  @override
  void dispose() {
    widget.emailController?.dispose();
    widget.passwordController?.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    setState(() {
      _formState = _formState.copyWith(
        email: EmailValidation.dirty(
          emailRegExp: widget.emailRegExp,
          value: widget.emailController!.text,
        ),
      );
    });
  }

  void _onPasswordChanged() {
    setState(() {
      _formState = _formState.copyWith(
        password: PasswordValidation.dirty(
          passwordRegExp: widget.passwordRegExp,
          value: widget.passwordController!.text,
        ),
      );
    });
  }

  Future<void> _onSubmit() async {
    if (!_key.currentState!.validate()) return;

    setState(() {
      _formState = _formState.copyWith(status: FormzSubmissionStatus.inProgress);
    });

    try {
      widget.onSignUpTap?.call();
      _formState = _formState.copyWith(status: FormzSubmissionStatus.success);
    } catch (_) {
      _formState = _formState.copyWith(status: FormzSubmissionStatus.failure);
    }

    if (!mounted) return;

    setState(() {});

    FocusScope.of(context)
      ..nextFocus()
      ..unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: LayoutWrapper(
        contentPadding: widget.contentPadding,
        useSafeArea: widget.useSafeArea,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: widget.logo),
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
                    if (widget.isEmailEnabled)
                      EmailInput(
                        controller: widget.emailController,
                        validator: (value) =>
                            _formState.email.validator(value ?? '')?.text(invalidText: widget.emailInvalidText),
                      ),
                    const SizedBox(height: 16),
                    if (widget.isUsernameEnabled) ...[
                      const UsernameInput(),
                      const SizedBox(height: 16),
                    ],
                    if (widget.isPasswordEnabled) ...[
                      PasswordInput(
                        controller: widget.passwordController,
                        validator: (value) =>
                            _formState.password.validator(value ?? '')?.text(invalidText: widget.passwordInvalidText),
                        isResetPasswordEnabled: false,
                        onPasswordRecoveryTap: widget.onPasswordRecoveryTap,
                      ),
                      const SizedBox(height: 32),
                    ],
                    IntrinsicWidth(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          EWBaseButton.filled(
                            onPressed: _onSubmit,
                            title: 'Create Account',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildApproveSection(),
                    const SizedBox(height: 32),
                    if (widget.socialAuthProviders.isNotEmpty) ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: _buildAuthProvider(context),
                      ),
                      const SizedBox(height: 24),
                    ],
                    if (widget.isSignInEnabled)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: context.textStyle(TextScale.bodyMedium),
                          ),
                          EWBaseButton.text(
                            onPressed: widget.onCreateAccountTap,
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
      ),
    );
  }

  Widget _buildApproveSection() {
    if (widget.onPrivacyPolicyTap == null && widget.onTermsAndConditionTap == null) {
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
        if (widget.onPrivacyPolicyTap != null)
          EWBaseButton.text(
            title: 'Privacy Policy',
            onPressed: widget.onPrivacyPolicyTap,
          ),
        if (widget.onPrivacyPolicyTap != null && widget.onTermsAndConditionTap != null) const Text('and '),
        if (widget.onTermsAndConditionTap != null) ...[
          EWBaseButton.text(
            title: 'Terms and conditions',
            onPressed: widget.onTermsAndConditionTap,
          )
        ],
      ],
    );
  }

  Widget _buildAuthProvider(BuildContext context) {
    final showTitle = widget.socialAuthProviders.length < 3;
    final List<Widget> socialButtons = [];

    widget.socialAuthProviders.asMap().forEach((index, social) {
      socialButtons.add(buildSocialButton(social, showTitle));
      if (index < widget.socialAuthProviders.length - 1) {
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
