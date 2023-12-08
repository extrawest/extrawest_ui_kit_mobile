import 'package:extrawest_ui_kit/consts.dart';
import 'package:flutter/material.dart';

final borderRadius = BorderRadius.circular(buttonDefaultBorderRadius);

sealed class ButtonType {
  const ButtonType();
}

class Elevated extends ButtonType {
  const Elevated();
}

class Filled extends ButtonType {
  const Filled();
}

class FilledTonal extends ButtonType {
  const FilledTonal();
}

class FilledError extends ButtonType {
  const FilledError();
}

class Outlined extends ButtonType {
  const Outlined();
}

class TextType extends ButtonType {
  const TextType();
}

class EWBaseButton extends StatelessWidget {
  final ButtonType buttonType;

  final VoidCallback? onPressed;
  final String? title;
  final bool showTitle;
  final Widget? icon;

  const EWBaseButton({
    this.buttonType = const Filled(),
    this.onPressed,
    this.title,
    this.icon,
    this.showTitle = true,
    Key? key,
  }) : super(key: key);

  factory EWBaseButton.filled({
    Key? key,
    void Function()? onPressed,
    Widget? icon,
    String? title,
    bool showTitle = true,
    bool isLoading = false,
    ButtonStyle? style,
  }) =>
      EWBaseButton(
        key: key,
        onPressed: onPressed,
        title: title,
        buttonType: const Filled(),
        showTitle: showTitle,
        icon: icon,
        // isLoading: isLoading,
        // style: style,
      );

  factory EWBaseButton.elevated({
    Key? key,
    void Function()? onPressed,
    Widget? icon,
    String? title,
    bool showTitle = true,
    bool isLoading = false,
    ButtonStyle? style,
  }) =>
      EWBaseButton(
        key: key,
        onPressed: onPressed,
        title: title,
        buttonType: const Elevated(),
        showTitle: showTitle,
        icon: icon,

        // isLoading: isLoading,
        // style: style,
      );

  factory EWBaseButton.text({
    Key? key,
    void Function()? onPressed,
    Widget? icon,
    String? title,
    bool showTitle = true,
    bool isLoading = false,
    ButtonStyle? style,
  }) =>
      EWBaseButton(
        key: key,
        onPressed: onPressed,
        title: title,
        buttonType: const TextType(),
        showTitle: showTitle,
        icon: icon,

        // isLoading: isLoading,
        // style: style,
      );

  factory EWBaseButton.filledTonal({
    Key? key,
    void Function()? onPressed,
    Widget? icon,
    String? title,
    bool showTitle = true,
    bool isLoading = false,
    ButtonStyle? style,
  }) =>
      EWBaseButton(
        key: key,
        onPressed: onPressed,
        title: title,
        buttonType: const FilledTonal(),
        showTitle: showTitle,
        icon: icon,

        // isLoading: isLoading,
        // style: style,
      );

  factory EWBaseButton.outlined({
    Key? key,
    void Function()? onPressed,
    Widget? icon,
    String? title,
    bool showTitle = true,
    bool isLoading = false,
    ButtonStyle? style,
  }) =>
      EWBaseButton(
        key: key,
        onPressed: onPressed,
        title: title,
        buttonType: const Outlined(),
        showTitle: showTitle,
        icon: icon,

        // isLoading: isLoading,
        // style: style,
      );

  @override
  Widget build(BuildContext context) {
    final child = title != null ? Text(title!) : const SizedBox();
    final useIcon = icon != null;
    if (!showTitle && useIcon) {
      return IconButton(onPressed: onPressed, icon: icon!);
    }
    return switch (buttonType) {
      Filled() => useIcon
          ? FilledButton.icon(
              onPressed: onPressed,
              icon: icon!,
              label: child,
            )
          : FilledButton(
              onPressed: onPressed,
              child: child,
            ),
      Elevated() => useIcon
          ? ElevatedButton.icon(
              onPressed: onPressed,
              icon: icon!,
              label: child,
            )
          : ElevatedButton(
              onPressed: onPressed,
              child: child,
            ),
      FilledTonal() => useIcon
          ? FilledButton.tonalIcon(
              onPressed: onPressed,
              icon: icon!,
              label: child,
            )
          : FilledButton.tonal(
              onPressed: onPressed,
              child: child,
            ),
      FilledError() => useIcon
          ? FilledButton.icon(
              onPressed: onPressed,
              icon: icon!,
              label: child,
            )
          : FilledButton(
              onPressed: onPressed,
              child: child,
            ),
      Outlined() => useIcon
          ? OutlinedButton.icon(
              onPressed: onPressed,
              icon: icon!,
              label: child,
            )
          : OutlinedButton(
              onPressed: onPressed,
              child: child,
            ),
      TextType() => useIcon
          ? TextButton.icon(
              onPressed: onPressed,
              icon: icon!,
              label: child,
            )
          : TextButton(
              onPressed: onPressed,
              child: child,
            ),
    };
  }
}
