// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../Core/Style/assets.dart';
import '../../../../../Core/Style/icon_style.dart';
import '../../../../../Core/Theme/app_colors.dart';
import '../../../../../Core/Theme/text_theme.dart';

class MainAppbar extends StatelessWidget {
  final Color? color;
  final bool isBack;
  final String? title;

  const MainAppbar({super.key, this.color, this.isBack = false, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      leadingWidth: 80,
      leading: Padding(
        padding: const EdgeInsets.all(6.0),
        child: IconButtonStyleWidget(
          icon: SvgPicture.asset(SvgAssets.drawerMenu),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      title: Text(
        '',
        style: TextThemeStyle.textThemeStyle.titleLarge!.copyWith(
          color: AppColors.mainColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: IconButtonStyleWidget(
            icon: SvgPicture.asset(SvgAssets.profile),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
