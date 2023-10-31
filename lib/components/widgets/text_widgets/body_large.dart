import 'package:flutter/material.dart';

class BodyLarge extends StatelessWidget {
  final String text;
  final Color? color;

  const BodyLarge({
    required this.text,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: color),
    );
  }
}
