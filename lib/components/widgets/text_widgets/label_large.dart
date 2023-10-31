import 'package:flutter/material.dart';

class LabelLarge extends StatelessWidget {
  final String text;
  final Color? color;

  const LabelLarge({
    required this.text,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(color: color),
    );
  }
}
