import 'package:flutter/material.dart';

import 'Widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'HomeScreen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeBody());
  }
}
