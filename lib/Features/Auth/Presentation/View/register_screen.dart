import 'package:flutter/material.dart';

import '../../../../Core/Style/assets.dart';
import 'Widgets/register_body.dart';

class RegisterScreen extends StatelessWidget {
  static const String id = 'RegisterScreen';

  const RegisterScreen({super.key});

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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: RegisterBody(),
      ),
    );
  }
}
