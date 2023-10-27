import 'package:flutter/material.dart';

final borderRadius = BorderRadius.circular(100.0);

class CommonButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const CommonButton({
    required this.onTap,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      borderRadius: borderRadius,
      color: theme.colorScheme.primary,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onTap,
        child: Container(
          width: 240,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: theme.colorScheme.onPrimary),
            ),
          ),
        ),
      ),
    );
  }
}
