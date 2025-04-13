// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../Core/Style/assets.dart';
import '../../../../../Core/Style/icon_style.dart';
import '../../../../../Core/Theme/app_colors.dart';
import '../../../../Home/Presentation/View/home_screen.dart';
import '../../../../Main/Presentation/BloC/MainCubit/main_screen_cubit.dart';

class CalendarAppbar extends StatelessWidget {
  final Widget? title;
  final Color? backgroundColor;

  const CalendarAppbar({super.key, this.title, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor ?? AppColors.white,
      leadingWidth: 80,
      leading: IconButtonStyleWidget(
        icon: SvgPicture.asset(
          SvgAssets.arrowLeft,
          color: title != null ? AppColors.white : AppColors.mainColor,
        ),
        onPressed: () {
          title != null
              ? Navigator.pop(context)
              : context.read<MainScreenCubit>().changePage(HomeScreen.id);
        },
      ),
      title: title,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: IconButtonStyleWidget(
            icon: SvgPicture.asset(
              SvgAssets.search,
              color: title != null ? AppColors.white : AppColors.mainColor,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
