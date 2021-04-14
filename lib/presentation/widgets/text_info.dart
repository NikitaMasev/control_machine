import 'package:flutter/material.dart';

class TextInfo extends StatelessWidget {
  final String text;

  const TextInfo({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
