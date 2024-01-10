import 'package:flutter/material.dart';

/// This wrapper widget is universal and wrap its child with [Scaffold] and [Padding]
class LayoutWrapper extends StatelessWidget {
  final EdgeInsets? contentPadding;
  final Widget child;
  final bool useSafeArea;

  const LayoutWrapper({
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
          padding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 16.0),
          child: child,
        ),
      ),
    );
  }
}
