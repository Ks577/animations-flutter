import 'package:flutter/material.dart';
import 'package:flutter_animations/const/colors.dart';

class StyleAppBar extends StatelessWidget {
  const StyleAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.bottomRight,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
