import 'package:extrawest_ui_kit/components/sign_in/widgets/password_input.dart';
import 'package:extrawest_ui_kit/components/widgets/ew_base_button.dart';
import 'package:extrawest_ui_kit/components/widgets/text_widgets/text_scales.dart';
import 'package:extrawest_ui_kit/layouts/layout_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:password_strength/password_strength.dart';

/// Layout for creating a new password
class CreateNewPassword extends StatefulWidget {
  final VoidCallback? onSaveNewPasswordPressed;
  final TextEditingController passwordController;

  /// Use this
  final String? Function(String?)? passwordValidator;
  final String? passwordRequirementsText;
  final bool isPasswordStrengthEnabled;

  /// Here you can use either the package's [Logo] component, either custom one
  final Widget? logo;

  const CreateNewPassword({
    required this.passwordController,
    this.isPasswordStrengthEnabled = true,
    this.onSaveNewPasswordPressed,
    this.passwordRequirementsText,
    this.passwordValidator,
    this.logo,
    Key? key,
  }) : super(key: key);

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutWrapper(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.logo != null) ...[
            widget.logo!,
            const SizedBox(height: 40),
          ],
          const SizedBox(height: 40),
          Text(
            'New password',
            style: context.textStyle(TextScale.titleLarge),
          ),
          const SizedBox(height: 8),
          Text(
            widget.passwordRequirementsText ??
                'Password must contain at least 7 letters and 1 number',
            style: context.textStyle(TextScale.bodyMedium),
          ),
          const SizedBox(height: 40),
          PasswordInput(
            controller: _passwordController,
            validator: widget.passwordValidator,
          ),
          if (widget.isPasswordStrengthEnabled) ...[
            const SizedBox(height: 8),
            PasswordStrength(passwordController: _passwordController),
          ],
          const SizedBox(height: 40),
          EWBaseButton.filled(
            onPressed: widget.onSaveNewPasswordPressed,
            title: 'Save new password',
          ),
        ],
      ),
    );
  }
}

class PasswordStrength extends StatefulWidget {
  final TextEditingController passwordController;

  const PasswordStrength({
    required this.passwordController,
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordStrength> createState() => _PasswordStrengthState();
}

class _PasswordStrengthState extends State<PasswordStrength> {
  double _passwordStrength = 0.0;
  Color _firstColor = Colors.grey;
  Color _secondColor = Colors.grey;
  Color _thirdColor = Colors.grey;
  String _passwordTitle = '';

  @override
  void initState() {
    widget.passwordController.addListener(() {
      _passwordStrength =
          estimatePasswordStrength(widget.passwordController.text);
      _calculateColor();
    });
    super.initState();
  }

  void _calculateColor() {
    setState(() {
      if (_passwordStrength < 0.33) {
        _firstColor = Colors.red;
        _secondColor = Colors.grey;
        _thirdColor = Colors.grey;
        _passwordTitle = 'Weak password';
      } else if (_passwordStrength >= 0.33 && _passwordStrength < 0.66) {
        _firstColor = Colors.yellow;
        _secondColor = Colors.yellow;
        _thirdColor = Colors.grey;
        _passwordTitle = 'Average password';
      } else {
        _firstColor = Colors.green;
        _secondColor = Colors.green;
        _thirdColor = Colors.green;
        _passwordTitle = 'Strong password';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _passwordTitle,
          style: context.textStyle(TextScale.bodySmall),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(95.0),
                  color: _firstColor,
                ),
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Container(
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(95.0),
                  color: _secondColor,
                ),
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Container(
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(95.0),
                  color: _thirdColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
