import 'dart:ui';

import 'package:flutter/material.dart';

class ErrorForm extends StatelessWidget {
  final String error;
  final VoidCallback retry;

  const ErrorForm({
    @required this.error,
    @required this.retry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            error,
            style: TextStyle(
              fontSize: 14,
              color: Colors.redAccent,
            ),
          ),
          ElevatedButton(
            onPressed: retry,
            child: Text(
              'Повторить',
            ),
          ),
        ],
      ),
    );
  }
}
