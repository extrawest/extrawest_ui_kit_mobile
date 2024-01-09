import 'package:extrawest_ui_kit/components/widgets/logo.dart';
import 'package:extrawest_ui_kit/components/widgets/text_widgets/text_scales.dart';
import 'package:extrawest_ui_kit/extrawest_ui_kit.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  /// Here you can use either the package's [Logo] component, either custom one
  final Widget? logo;
  final String? title;
  final String? backgroundPath;
  final Color? backgroundColor;

  const SplashScreen({
    this.title,
    this.logo,
    this.backgroundPath,
    this.backgroundColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        color: backgroundPath == null ? (backgroundColor ?? darkColorScheme.primary) : null,
        decoration: backgroundPath != null
            ? BoxDecoration(
                image: DecorationImage(image: AssetImage(backgroundPath!), fit: BoxFit.cover),
              )
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (logo != null) ...[
              logo!,
              const SizedBox(height: 40),
            ],
            if (title != null)
              Center(
                child: Text(
                  title!,
                  style: context.textStyle(TextScale.titleLarge),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
