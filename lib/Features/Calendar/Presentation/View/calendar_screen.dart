import 'package:flutter/material.dart';

import 'Widgets/calendar_body.dart';

class CalendarScreen extends StatelessWidget {
  static const String id = 'CalendarScreen';

  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CalendarBody();
  }
}
