// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Services/globals.dart';
import '../Theme/app_colors.dart';
import 'config.dart';

Locale local = ConfigLanguage.localLang ?? ConfigLanguage.enLocale;
Color colorEN = Colors.transparent;
Color colorAr = Colors.transparent;

changeLang(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (local == ConfigLanguage.arLocale) {
    context.setLocale(ConfigLanguage.enLocale);

    local = ConfigLanguage.enLocale;
    colorEN = AppColors.secondaryColor;

    colorAr = Colors.transparent;
    await prefs.setString('lang', local.toString());
    lang = 'en';
  } else {
    context.setLocale(ConfigLanguage.arLocale);

    local = ConfigLanguage.arLocale;
    colorAr = AppColors.secondaryColor;
    colorEN = Colors.transparent;
    await prefs.setString('lang', local.toString());
    lang = 'ar';
  }
  return local;
}
