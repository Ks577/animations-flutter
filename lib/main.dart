import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const WondersApp());
}

class WondersApp extends StatelessWidget {
  const WondersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wonders of Nature',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const SplashScreen(),
    );
  }
}
