import 'dart:ui';

import 'package:flutter/material.dart';

class CarBackground extends StatelessWidget {
  final String imagePath;
  final Widget child;

  const CarBackground(
      {super.key, required this.imagePath, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imagePath), fit: BoxFit.cover)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.0)),
            ),
          ),
        ),
        Center(
          child: child,
        )
      ],
    );
  }
}
