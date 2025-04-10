// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Utils/headers.dart';
import '../Services/globals.dart';
import '../Utils/locator.dart';
import 'config.dart';

Locale local = ConfigLanguage.localLang ?? ConfigLanguage.arLocale;

changeLang(BuildContext context, String selectedLang) async {
  final prefs = locator<SharedPreferences>();
  if (selectedLang == 'en') {
    context.setLocale(ConfigLanguage.enLocale);
    local = ConfigLanguage.enLocale;
    await prefs.setString('lang', local.toString());
    lang = 'en';
  } else {
    context.setLocale(ConfigLanguage.arLocale);
    local = ConfigLanguage.arLocale;
    await prefs.setString('lang', local.toString());
    lang = 'ar';
  }

  globalHeaders["Accept-Language"] = lang;
  return local;
}
