import 'package:flutter/material.dart';
import 'Widgets/notification_body.dart';

class NotificationScreen extends StatelessWidget {
  static const String id = 'NotificationScreen';
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: NotificationBody());
  }
}
