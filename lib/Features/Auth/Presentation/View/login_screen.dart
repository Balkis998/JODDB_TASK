import 'package:flutter/material.dart';

import 'Widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'LoginScreen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginBody());
  }
}
