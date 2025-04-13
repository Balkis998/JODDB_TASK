import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Theme/app_colors.dart';
import '../Theme/text_theme.dart';

class AppStyles {
  static InputDecoration formStyle(
    String hint, {
    Widget? suffixIcon,
    Widget? suffix,
    Widget? prefixIcon,
    double? radius,
    Color? filledColor,
    Color? borderColor,
    Color? focusBorderColor,
    TextStyle? hintStyle,
    Color? errorBorderColor,
    Widget? label,
    Color? labelColor,
    BuildContext? context,
    EdgeInsetsGeometry? contentPadding,
    Color? enabledBorderColor,
  }) {
    return InputDecoration(
      label: label,
      labelStyle: TextThemeStyle.textThemeStyle.bodyMedium!.copyWith(
        color: labelColor ?? AppColors.mainColor,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor ?? AppColors.borderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: focusBorderColor ?? AppColors.mainColor),
        borderRadius: BorderRadius.circular(8),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor ?? AppColors.borderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: errorBorderColor ?? AppColors.errorColor,
          width: 2.w,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding:
          contentPadding ??
          EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
      fillColor: filledColor ?? AppColors.formFillColor,
      suffixIcon: suffixIcon,
      suffix: suffix,
      prefixIcon: prefixIcon,
      filled: true,
      hintStyle:
          hintStyle ??
          TextThemeStyle.textThemeStyle.bodyMedium!.copyWith(
            color: AppColors.hintColor,
          ),
      hintText: hint,
    );
  }

  static InputDecoration underlineFormStyle(
    String hint, {
    Widget? suffixIcon,
    Widget? suffix,
    Widget? prefixIcon,
    double? radius,
    Color? filledColor,
    Color? borderColor,
    Color? focusBorderColor,
    TextStyle? hintStyle,
    Color? errorBorderColor,
    Widget? label,
    Color? labelColor,
    BuildContext? context,
    EdgeInsetsGeometry? contentPadding,
    Color? enabledBorderColor,
  }) {
    return InputDecoration(
      label: label,
      labelStyle: TextThemeStyle.textThemeStyle.bodyMedium!.copyWith(
        color: labelColor ?? AppColors.mainColor,
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: borderColor ?? AppColors.borderColor),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: focusBorderColor ?? AppColors.borderColor,
        ),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: borderColor ?? AppColors.borderColor),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: errorBorderColor ?? AppColors.errorColor,
          width: 2.w,
        ),
      ),
      contentPadding:
          contentPadding ??
          EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
      fillColor: filledColor ?? AppColors.formFillColor,
      suffixIcon: suffixIcon,
      suffix: suffix,
      prefixIcon: prefixIcon,
      filled: true,
      hintStyle:
          hintStyle ??
          TextThemeStyle.textThemeStyle.bodyMedium!.copyWith(
            color: AppColors.hintColor,
          ),
      hintText: hint,
    );
  }
}
