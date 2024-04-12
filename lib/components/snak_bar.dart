import 'package:flutter/material.dart';

class MySnackbar extends SnackBar {
  final String message;

  MySnackbar({required this.message})
      : super(
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          duration: Duration(seconds: 2),
        );
}
