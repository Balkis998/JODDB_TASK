import 'package:flutter/material.dart';

import 'Widgets/register_body.dart';

class RegisterScreen extends StatelessWidget {
  static const String id = 'RegisterScreen';

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: RegisterBody());
  }
}
