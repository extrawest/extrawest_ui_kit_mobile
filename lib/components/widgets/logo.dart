import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String? title;

  const Logo({this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(color: Colors.yellow),
        Text(
          title ?? '',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );
  }
}
