import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../Core/Style/assets.dart';
import '../../../../../Core/Utils/locator.dart';
import '../../../../Auth/Presentation/View/login_screen.dart';
import '../../../../Main/Presentation/View/main_screen.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  @override
  void initState() {
    _navigateAfterDelay();
    super.initState();
  }

  void _navigateAfterDelay() async {
    final prefs = locator<SharedPreferences>();
    final String? token = prefs.getString('firebase_token'); // Retrieve token

    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    // Check if token exists and navigate accordingly
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder:
            (context) =>
                token != null && token != '' && token.isNotEmpty
                    ? const MainScreen() // Navigate to MainScreen if token exists
                    : const LoginScreen(), // Navigate to LoginScreen if no token
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(ImageAssets.logo, fit: BoxFit.cover)),
    );
  }
}
