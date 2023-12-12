import 'package:flutter/material.dart';

class SignInLayout extends StatelessWidget {
  final EdgeInsets? contentPadding;
  final Widget child;
  final bool useSafeArea;

  const SignInLayout({
    required this.child,
    this.contentPadding,
    this.useSafeArea = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: useSafeArea,
        bottom: useSafeArea,
        left: useSafeArea,
        right: useSafeArea,
        child: Padding(
          padding: contentPadding ??
              (MediaQuery.of(context).orientation == Orientation.portrait
                  ? const EdgeInsets.symmetric(horizontal: 16.0)
                  : const EdgeInsets.symmetric(horizontal: 102.0)),
          child: child,
        ),
      ),
    );
  }
}
