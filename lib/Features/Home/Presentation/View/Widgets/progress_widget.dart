// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../Core/Services/Spacer/spacer_static.dart';
import '../../../../../Core/Style/assets.dart';
import '../../../../../Core/Theme/app_colors.dart';
import '../../../../../Core/Theme/text_theme.dart';
import '../../../../Calendar/Presentation/BloC/TaskCubit/task_cubit.dart';
import 'gradiant_widget.dart';

class ProgressWidget extends StatelessWidget {
  final String text;
  const ProgressWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box('tasksBox');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextThemeStyle.textThemeStylePrimary.headlineSmall!.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          StaticSpacer.spacer32,

          BlocBuilder<TaskCubit, TaskState>(
            builder: (context, state) {
              return ValueListenableBuilder(
                valueListenable: box.listenable(),
                builder: (context, Box taskBox, _) {
                  final user = FirebaseAuth.instance.currentUser;
                  if (user == null) {
                    return Text('User not logged in.');
                  }

                  final allTasks =
                      taskBox.values.where((task) {
                        return task['userID'] == user.uid;
                      }).toList();

                  final filteredTasks =
                      state.selectedDate != null
                          ? allTasks.where((task) {
                            final taskDateStr = task['date'];
                            final taskDate = DateFormat(
                              'MMM d, yyyy',
                            ).parse(taskDateStr);
                            return taskDate.year == state.selectedDate!.year &&
                                taskDate.month == state.selectedDate!.month &&
                                taskDate.day == state.selectedDate!.day;
                          }).toList()
                          : allTasks;

                  if (filteredTasks.isEmpty) {
                    return Text('No tasks yet.');
                  }

                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: filteredTasks.length,
                    itemBuilder: (_, index) {
                      final task = filteredTasks[index];

                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.blackColor.withOpacity(0.02),
                              offset: Offset(0, -7),
                              blurRadius: 23,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Text(
                            task['name'] ?? '',
                            style: TextThemeStyle
                                .textThemeStylePrimary
                                .bodyLarge!
                                .copyWith(fontWeight: FontWeight.w800),
                          ),
                          subtitle: Text(
                            task['date'] ?? '',
                            style: TextThemeStyle
                                .textThemeStylePrimary
                                .bodySmall!
                                .copyWith(color: AppColors.primary),
                          ),
                          leading: GradiantWidget(assetName: SvgAssets.list),
                          trailing: SvgPicture.asset(SvgAssets.menu),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
