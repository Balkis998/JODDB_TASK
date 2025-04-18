import 'package:flutter/material.dart';

import '../../../../Core/Style/assets.dart';
import 'Widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'LoginScreen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageAssets.background),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(backgroundColor: Colors.transparent, body: LoginBody()),
    );
  }
}
