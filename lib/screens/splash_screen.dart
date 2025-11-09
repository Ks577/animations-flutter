import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../const/colors.dart';
import '../const/text_style.dart';
import 'list_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 46), // плавное вращение
    )..repeat();

    Timer(const Duration(seconds: 7), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(seconds: 2),
          pageBuilder: (context, _, __) => const ListScreen(),
          transitionsBuilder: (context, animation, _, child) {
            // сдвиг экрана снизу вверх
            final offsetAnimation = Tween<Offset>(
              begin: const Offset(0, 1), // начинается ниже экрана
              end: Offset.zero, // конечная позиция на месте
            ).animate(animation);
            return SlideTransition(
              position: offsetAnimation,
              child: FadeTransition(
                opacity: animation, // плавное появление
                child: child,
              ),
            );
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 6,
                left: 0,
                right: 8,
                child: RotationTransition(
                  turns: _rotationController,
                  child: Image.asset(
                    'assets/images/cloud.png',
                    width: 700.0,
                    height: 300.0,
                  ),
                ),
              ),
              Center(
                child: AnimatedTextKit(
                  repeatForever: true,
                  isRepeatingAnimation: true,
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'Wonders of nature',
                      textStyle: colorizeTextStyle,
                      colors: gradientColorsShimmer,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
