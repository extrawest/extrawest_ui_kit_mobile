import 'package:flutter/material.dart';

enum TextScale {
  displayLarge,

  displayMedium,

  displaySmall,

  headlineMedium,

  headlineSmall,

  titleLarge,

  titleMedium,

  titleSmall,

  bodyLarge,

  bodyMedium,

  labelLarge,

  bodySmall,
  labelMedium,

  labelSmall,
}

extension ContextExtension on BuildContext {
  TextStyle textStyle(
    TextScale scale, {
    Color? color,
    FontWeight? fontWeight,
    double? size,
    String? fontFamily,
    double? letterSpacing,
    TextDecoration? decoration,
    double? height,
    FontStyle? fontStyle,
  }) {
    switch (scale) {
      case TextScale.displayLarge:
        return Theme.of(this).textTheme.displayLarge!.copyWith(
              color: color,
              fontWeight: fontWeight,
              fontSize: size?.toDouble(),
              fontFamily: fontFamily,
              letterSpacing: letterSpacing,
              decoration: decoration,
              height: height,
              fontStyle: fontStyle,
            );
      case TextScale.displayMedium:
        return Theme.of(this).textTheme.displayMedium!.copyWith(
              color: color,
              fontWeight: fontWeight,
              fontSize: size?.toDouble(),
              fontFamily: fontFamily,
              letterSpacing: letterSpacing,
              decoration: decoration,
              height: height,
              fontStyle: fontStyle,
            );
      case TextScale.displaySmall:
        return Theme.of(this).textTheme.displaySmall!.copyWith(
              color: color,
              fontWeight: fontWeight,
              fontSize: size?.toDouble(),
              fontFamily: fontFamily,
              letterSpacing: letterSpacing,
              decoration: decoration,
              height: height,
              fontStyle: fontStyle,
            );
      case TextScale.headlineMedium:
        return Theme.of(this).textTheme.headlineMedium!.copyWith(
              color: color,
              fontWeight: fontWeight,
              fontSize: size?.toDouble(),
              fontFamily: fontFamily,
              letterSpacing: letterSpacing,
              decoration: decoration,
              height: height,
              fontStyle: fontStyle,
            );
      case TextScale.headlineSmall:
        return Theme.of(this).textTheme.headlineSmall!.copyWith(
              color: color,
              fontWeight: fontWeight,
              fontSize: size?.toDouble(),
              fontFamily: fontFamily,
              letterSpacing: letterSpacing,
              decoration: decoration,
              height: height,
              fontStyle: fontStyle,
            );
      case TextScale.titleLarge:
        return Theme.of(this).textTheme.titleLarge!.copyWith(
              color: color,
              fontWeight: fontWeight,
              fontSize: size?.toDouble(),
              fontFamily: fontFamily,
              letterSpacing: letterSpacing,
              decoration: decoration,
              height: height,
              fontStyle: fontStyle,
            );
      case TextScale.titleMedium:
        return Theme.of(this).textTheme.titleMedium!.copyWith(
              color: color,
              fontWeight: fontWeight,
              fontSize: size?.toDouble(),
              fontFamily: fontFamily,
              letterSpacing: letterSpacing,
              decoration: decoration,
              height: height,
              fontStyle: fontStyle,
            );
      case TextScale.titleSmall:
        return Theme.of(this).textTheme.titleSmall!.copyWith(
              color: color,
              fontWeight: fontWeight,
              fontSize: size?.toDouble(),
              fontFamily: fontFamily,
              letterSpacing: letterSpacing,
              decoration: decoration,
              height: height,
              fontStyle: fontStyle,
            );
      case TextScale.bodyLarge:
        return Theme.of(this).textTheme.bodyLarge!.copyWith(
              color: color,
              fontWeight: fontWeight,
              fontSize: size?.toDouble(),
              fontFamily: fontFamily,
              letterSpacing: letterSpacing,
              decoration: decoration,
              height: height,
              fontStyle: fontStyle,
            );
      case TextScale.bodyMedium:
        return Theme.of(this).textTheme.bodyMedium!.copyWith(
              color: color,
              fontWeight: fontWeight,
              fontSize: size?.toDouble(),
              fontFamily: fontFamily,
              letterSpacing: letterSpacing,
              decoration: decoration,
              height: height,
              fontStyle: fontStyle,
            );
      case TextScale.labelLarge:
        return Theme.of(this).textTheme.labelLarge!.copyWith(
              color: color,
              fontWeight: fontWeight,
              fontSize: size?.toDouble(),
              fontFamily: fontFamily,
              letterSpacing: letterSpacing,
              decoration: decoration,
              height: height,
              fontStyle: fontStyle,
            );
      case TextScale.bodySmall:
        return Theme.of(this).textTheme.bodySmall!.copyWith(
              color: color,
              fontWeight: fontWeight,
              fontSize: size?.toDouble(),
              fontFamily: fontFamily,
              letterSpacing: letterSpacing,
              decoration: decoration,
              height: height,
              fontStyle: fontStyle,
            );
      case TextScale.labelSmall:
        return Theme.of(this).textTheme.labelSmall!.copyWith(
              color: color,
              fontWeight: fontWeight,
              fontSize: size?.toDouble(),
              fontFamily: fontFamily,
              letterSpacing: letterSpacing,
              decoration: decoration,
              height: height,
              fontStyle: fontStyle,
            );
      case TextScale.labelMedium:
        return Theme.of(this).textTheme.labelMedium!.copyWith(
              color: color,
              fontWeight: fontWeight,
              fontSize: size?.toDouble(),
              fontFamily: fontFamily,
              letterSpacing: letterSpacing,
              decoration: decoration,
              height: height,
              fontStyle: fontStyle,
            );
      default:
        throw Error();
    }
  }
}
