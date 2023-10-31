import 'package:extrawest_ui_kit/components/sign_in/widgets/email_input.dart';
import 'package:extrawest_ui_kit/components/sign_in/widgets/password_input.dart';
import 'package:extrawest_ui_kit/components/sign_in/widgets/phone_number_input.dart';
import 'package:extrawest_ui_kit/components/widgets/common_button.dart';
import 'package:extrawest_ui_kit/components/widgets/text_widgets/body_medium.dart';
import 'package:extrawest_ui_kit/components/widgets/text_widgets/label_large.dart';
import 'package:extrawest_ui_kit/components/widgets/text_widgets/title_large.dart';
import 'package:flutter/material.dart';

enum AuthType {
  emailLink,
  emailPassword,
  phonePassword;

  bool get isEmailLink => this == emailLink;

  bool get isEmailPassword => this == emailPassword;

  bool get isPhonePassword => this == phonePassword;
}

class SignInLayout extends StatelessWidget {
  final Widget child;
  const SignInLayout({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: child,
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

  const SignIn({
    required this.authType,
    this.emailController,
    this.passwordController,
    this.phoneNumberController,
    this.emailValidator,
    this.passwordValidator,
    this.phoneNumberValidator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SignInLayout(
      child: Column(
        children: [
          const _ExtrawestLogo(),
          const Spacer(),
          const TitleLarge(text: 'Sign In'),
          const SizedBox(height: 40),
          if (authType.isEmailPassword || authType.isEmailLink)
            EmailInput(
              controller: emailController,
              validator: emailValidator,
            ),
          if (authType.isPhonePassword) const PhoneNumberInput(),
          const SizedBox(height: 16),
          if (authType.isEmailPassword || authType.isPhonePassword) ...[
            PasswordInput(
              controller: passwordController,
              validator: passwordValidator,
            ),
            const SizedBox(height: 16),
          ],
          CommonButton(onTap: () {}, text: 'Sign In'),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const BodyMedium(text: "Don't have an account"),
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
}

class _ExtrawestLogo extends StatelessWidget {
  const _ExtrawestLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Extrawest widget
          Container(color: Colors.yellow),
          Text(
            'Extrawest',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ],
      ),
    );
  }
}
