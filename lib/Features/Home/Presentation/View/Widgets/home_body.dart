// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/Services/Spacer/spacer_static.dart';
import '../../../../../Core/Theme/app_colors.dart';
import '../../../../../Core/Theme/text_theme.dart';
import '../../../../Calendar/Presentation/BloC/TaskCubit/task_cubit.dart';
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, Balqees!',
                    style: TextThemeStyle.textThemeStylePrimary.headlineLarge!
                        .copyWith(fontWeight: FontWeight.w800),
                  ),
                  StaticSpacer.spacer8,
                  Text(
                    'Have a nice day.',
                    style: TextThemeStyle.textThemeStylePrimary.bodyLarge!
                        .copyWith(color: AppColors.mainColor),
                  ),
                  StaticSpacer.spacer24,
                ],
              ),
            ),
            TasksWidget(),
            StaticSpacer.spacer48,
            ProgressWidget(text: 'Progress'),
          ],
        ),
      ),
    );
  }
}
