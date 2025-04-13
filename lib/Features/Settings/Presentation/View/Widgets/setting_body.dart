// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/Language/change_lang.dart';
import '../../../../../Core/Services/Spacer/spacer_static.dart';
import '../../../../../Core/Theme/app_colors.dart';
import '../../../../../Core/Theme/text_theme.dart';
import '../../../../Calendar/Presentation/BloC/TaskCubit/task_cubit.dart';

class SettingBody extends StatefulWidget {
  const SettingBody({super.key});

  @override
  State<SettingBody> createState() => _SettingBodyState();
}

class _SettingBodyState extends State<SettingBody> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: TextThemeStyle.textThemeStylePrimary.headlineLarge!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            StaticSpacer.spacer32,

            ListTile(
              onTap: () {},
              title: Text(
                'عربي',
                style: TextThemeStyle.textThemeStylePrimary.titleMedium,
              ),
              trailing: Icon(Icons.check, color: colorAr),
            ),
            Divider(
              color: AppColors.borderColor,
              thickness: 1.5.w,
              height: 40.h,
            ),
            ListTile(
              onTap: () {},
              title: Text(
                'English',
                style: TextThemeStyle.textThemeStylePrimary.titleMedium,
              ),
              trailing: Icon(Icons.check, color: colorEN),
            ),
          ],
        ),
      ),
    );
  }
}
