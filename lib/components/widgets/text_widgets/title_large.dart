import 'package:flutter/material.dart';

class TitleLarge extends StatelessWidget {
  final String text;

  const TitleLarge({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
