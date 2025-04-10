import 'package:flutter/material.dart';
import '../../../../../Core/Style/assets.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  // void _navigateAfterDelay() async {
  //   final prefs = locator<SharedPreferences>();
  //   final isLoggedIn = prefs.containsKey('access_token');

  //   await Future.delayed(const Duration(seconds: 3));

  //   if (!mounted) return;

  //   Navigator.of(context).pushReplacement(
  //     MaterialPageRoute(
  //       builder: (context) =>
  //           isLoggedIn ? const MainScreen() : const LoginScreen(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(ImageAssets.splash, fit: BoxFit.cover)),
    );
  }
}
