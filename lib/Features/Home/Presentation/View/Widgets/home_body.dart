// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/Services/Spacer/spacer_static.dart';
import '../../../../Calendar/Presentation/BloC/TaskCubit/task_cubit.dart';
import 'info_widget.dart';
import 'progress_widget.dart';
import 'tasks_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StaticSpacer.spacer32,
            InfoWidget(),
            TasksWidget(),
            StaticSpacer.spacer48,
            ProgressWidget(text: 'Progress'),
          ],
        ),
      ),
    );
  }
}
