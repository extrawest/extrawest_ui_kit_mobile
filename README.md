<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# extrawest_ui_kit

[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)]()
[![Maintaner](https://img.shields.io/static/v1?label=Extrawest&message=Maintainer&color=red)](mailto:roman.ovsepian@extrawest.com)
[![Ask Me Anything !](https://img.shields.io/badge/Ask%20me-anything-1abc9c.svg)]()
![GitHub license](https://img.shields.io/github/license/Naereen/StrapDown.js.svg)
![GitHub release](https://img.shields.io/badge/release-v0.0.1-blue)

A flutter package that provides you with ready Material 3 UI components

https://github.com/extrawest/extrawest_ui_kit_mobile/assets/117409513/10444169-8faa-47f8-a4be-bb32de347f60

## Features

1. Basic Material 3 UI componets:
    - Buttons (`Elevated`, `Filled`, `Text`, `Outlined`, `Icon`)
    - Text Fields (Email, Password, Custom)
    - Texts widgets with different [Material 3](https://flutter.github.io/samples/web/material_3_demo/) styles
2. Ready to use Layouts with ability to change components dynamically.
    - Sign In layout with components: Email, Password inputs, Password recovery section, etc.
    - Create Account layout with textfields validation

The advantage of these layouts is that they come with built-in components having default parameters, which also can be customized to fit the application's requirements.

## Usage

There are 2 approaches you can use package's components:
1. Using ready Layouts with specifying needed parameters(or use default ones)
2. Using components separately to your own goals.

## Available Customizable Components:

1. EWBaseButton
```dart
// FilledButton - factory constructor approach
EWBaseButton.filled(onPressed: () {}, title: 'Sign In'),

// OutlinedButton - passing parameter approach
EWBaseButton(buttonType: Outlined(), onPressed: () {}, title: 'Sign In'),
2. EWBaseTextFormField
```dart
// Use base textfield with custom configuration
EWTextField(
    controller: controller,
    autoValidateMode: AutovalidateMode.always,
    keyboardType: TextInputType.phone,
    prefixIcon: const Icon(Icons.add),
    errorText: 'Error',
    cursorColor: Colors.red,
    suffixIcon: const Text('Clear'),
),
```
3. Inputs based on EWBaseTextFormField: `EmailInput`, `PasswordInput`
``` dart
// Inputs
EmailInput(
    controller: emailController,
    hintText: 'Email Address'
    validator: (value) {
        if (value == null && value.isEmpty)
            return 'Invalid email';
        }
        return null;
    },
),
```
```
4. Social Auth Provider buttons: `Google`, `Apple`, `Facebook`, `X`
``` dart
// Use Social button
AppleButton(
    showTitle: false,
    onTap: () {
    // add tap handler here
    },
),
```
5. Text widgets with various Material 3 scales (`titleLarge`, `labelMedium`, `labelSmall` etc)
Access TextStyle from BuildContext context and pass TextScale as a positional argument
```dart
Text(
    'Sign In',
    style: context.textStyle(TextScale.titleLarge),
),
```
You can also specify other default TextStyle parameters

```dart
Text(
    'Sign In',
    style: context.textStyle(
      TextScale.titleLarge,
      fontStyle: FontStyle.italic,
      color: Colors.black
    ),
),
```
6. Logo
```dart
Logo(
  title: title,
  asset: 'path/to/asset',
),
```
## Available customizable layouts
1. Sign In
2. Create account

## How to use components

If you want to use components separately, just find required components and specify it with necessary parameters:


## Layout usage

``` dart
import 'package:extrawest_ui_kit/extrawest_ui_kit.dart';
import 'package:extrawest_ui_kit_app/common/screens/sign_up.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SignIn(
      emailController: _emailController,
      passwordController: _passwordController,
      useSafeArea: true,
      authType: AuthType.emailPassword,
      title: 'Test',
      isSignUpEnabled: true,
      isResetPasswordEnabled: true,
      isGuestEnabled: true,
      onCreateAccountTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        ),
      ),
      onSignInTap: () => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 2),
          content: Text('Sign In Attempt'),
        ),
      ),
      onSignInAsGuestTap: () => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 2),
          content: Text('Sign In as Guest Tap'),
        ),
      ),
      onPasswordRecoveryTap: () => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 2),
          content: Text('Password recovery'),
        ),
      ),
      socialAuthProviders: [
        SocialAuthProviderElement(
          socialAuthProvider: SocialAuthProvider.facebook,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Facebook login'),
              ),
            );
          },
        ),
        SocialAuthProviderElement(
          socialAuthProvider: SocialAuthProvider.google,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Google login'),
              ),
            );
          },
        ),
        SocialAuthProviderElement(
          socialAuthProvider: SocialAuthProvider.x,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('X login'),
              ),
            );
          },
        ),
        SocialAuthProviderElement(
          socialAuthProvider: SocialAuthProvider.appleId,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Apple login'),
              ),
            );
          },
        ),
      ],
    );
  }
}

```

