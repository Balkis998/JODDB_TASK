// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Style/assets.dart';
import '../Style/icon_style.dart';
import '../Theme/app_colors.dart';
import '../Theme/text_theme.dart';

class DefaultAppbar extends StatelessWidget {
  final Color? color;
  final bool isBack;
  final String? title;

  const DefaultAppbar({super.key, this.color, this.isBack = false, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      leadingWidth: 90,
      leading:
          isBack
              ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButtonStyleWidget(
                  icon: SvgPicture.asset(SvgAssets.arrowLeft),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )
              : const SizedBox(),
      title: Text(
        isBack ? title ?? '' : '',
        style: TextThemeStyle.textThemeStyle.titleLarge!.copyWith(
          color: AppColors.mainColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
