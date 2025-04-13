// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/Services/Spacer/spacer_static.dart';
import '../../../../Home/Presentation/View/Widgets/progress_widget.dart';
import '../../BloC/TaskCubit/task_cubit.dart';
import 'calendar_widget.dart';

class CalendarBody extends StatelessWidget {
  const CalendarBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CalenderWidget(),
            StaticSpacer.spacer48,
            ProgressWidget(text: 'Tasks'),
          ],
        ),
      ),
    );
  }
}
