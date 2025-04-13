import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'text_theme.dart';

/// Doc : https://api.flutter.dev/flutter/material/TextTheme-class.html
class CustomTheme {
  // * * * * * * * * * * * * *** Light *** * * * * * * * * * * * *
  static ThemeData lightTheme(BuildContext context) {
    TextThemeStyle.setTextTheme(context);
    TextThemeStyle.setTextThemePrimary(context);

    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        color: Colors.white,
        iconTheme: IconThemeData(color: AppColors.secondaryColor),
        titleTextStyle: TextThemeStyle.textThemeStyle.bodyLarge!.copyWith(
          color: AppColors.mainColor,
          fontSize: 24.sp,
          fontFamily: 'Inter',
        ),
      ),
      expansionTileTheme: const ExpansionTileThemeData(
        backgroundColor: Colors.transparent,
        collapsedBackgroundColor: Colors.transparent,
      ),
      iconTheme: IconThemeData(color: AppColors.secondaryColor),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconColor: WidgetStateProperty.resolveWith<Color?>((
            Set<WidgetState> states,
          ) {
            return AppColors.lightColor;
          }),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
      ),
      textTheme: Theme.of(context).textTheme.apply(
        bodyColor: AppColors.mainColor,
        displayColor: AppColors.mainColor,
        fontFamily: 'Inter',
      ),
      dividerColor: AppColors.lightColor,
    );
  }
}
