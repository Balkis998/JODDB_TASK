import 'package:flutter/material.dart';
import 'app_colors.dart';

class TextThemeStyle {
  static late TextTheme textThemeStyle;
  static late TextTheme textThemeStylePrimary;

  static void setTextTheme(BuildContext context) {
    textThemeStyle = Theme.of(
      context,
    ).textTheme.apply(bodyColor: AppColors.mainColor, fontFamily: 'Inter');
  }

  static void setTextThemePrimary(BuildContext context) {
    textThemeStylePrimary = Theme.of(
      context,
    ).textTheme.apply(bodyColor: AppColors.mainColor, fontFamily: 'Poppins');
  }
}
