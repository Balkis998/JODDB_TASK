import 'package:flutter/material.dart';

import '../../../../../Core/Theme/app_colors.dart';

class DateSelected {
  selectTime(BuildContext context, TimeOfDay timeFrom) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: timeFrom,
      builder: (_, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.mainColor,
            colorScheme: ColorScheme.light(primary: AppColors.secondaryColor),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      timeFrom = picked;

      return timeFrom;
    }
  }

  selectTimeTo(BuildContext context, TimeOfDay timeTo) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: timeTo,
      builder: (_, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.mainColor,
            colorScheme: ColorScheme.light(primary: AppColors.secondaryColor),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      timeTo = picked;

      return timeTo;
    }
  }
}
