import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'features/splash/splash_screen.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    (DevicePreview(enabled: true, builder: (context) => const WondersApp())),
  );
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
