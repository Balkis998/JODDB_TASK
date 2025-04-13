import 'package:flutter/material.dart';

import 'Widgets/task_body.dart';

class CreateTaskScreen extends StatelessWidget {
  static const String id = 'CreateTaskScreen';
  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CreateTaskBody());
  }
}
