import 'package:flutter/material.dart';

import 'Widgets/main_body.dart';

class MainScreen extends StatelessWidget {
  static const String id = 'MainScreen';

  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MainBody());
  }
}
