import 'package:extrawest_ui_kit/extrawest_ui_kit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: lightColorScheme,
        useMaterial3: true,
        inputDecorationTheme: createInputDecTheme(context),
      ),
      darkTheme: ThemeData(
        colorScheme: darkColorScheme,
        useMaterial3: true,
        inputDecorationTheme: createInputDecTheme(context),
      ),
      home: const SignInScreen(),
    );
  }
}

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SignInScreen> {
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
      logo: const Text('Login'),
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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: CreateAccount(
        emailController: _emailController,
        passwordController: _passwordController,
        useSafeArea: true,
        logo: const Text('Sign Up'),
        isSignInEnabled: true,
        isPasswordEnabled: true,
        onCreateAccountTap: () => Navigator.pop(context),
        emailRegExp: RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"),
        passwordRegExp: RegExp(r'^.{6,}$'),
        passwordInvalidText: 'Password must contain at least 6 characters',
        onSignUpTap: () => ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 2),
            content: Text('Create account Attempt'),
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
      ),
    );
  }
}
