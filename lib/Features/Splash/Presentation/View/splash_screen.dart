import 'package:flutter/material.dart';

import 'Widgets/splash_widget.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'SplashScreen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashWidget(),
    );
  }
}
