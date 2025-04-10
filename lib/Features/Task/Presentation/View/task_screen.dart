import 'package:flutter/material.dart';

import 'Widgets/task_body.dart';

class TaskScreen extends StatelessWidget {
  static const String id = 'TaskScreen';
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: TaskBody());
  }
}
