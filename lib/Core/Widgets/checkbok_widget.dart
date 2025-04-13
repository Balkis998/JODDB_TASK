import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/Theme/app_colors.dart';

class CheckboxWidget extends StatelessWidget {
  final bool value;
  final void Function(bool?)? onChanged;
  const CheckboxWidget({super.key, required this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: AppColors.mainColor,
      value: value,
      activeColor: AppColors.mainColor,
      fillColor: WidgetStateProperty.resolveWith<Color>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white; // Black box when checked
        }
        return Colors.white; // White box when unchecked
      }),
      side: WidgetStateBorderSide.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return BorderSide(color: AppColors.grey, width: 1);
        }

        return BorderSide(
          color: AppColors.grey,
          width: 1,
        ); // Black border when unchecked
      }),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: const VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.r)),
      onChanged: onChanged,
    );
  }
}
