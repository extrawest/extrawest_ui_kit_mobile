import 'package:flutter/material.dart';

class BodyMedium extends StatelessWidget {
  final String text;
  final Color? color;

  const BodyMedium({
    required this.text,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: color),
    );
  }
}
