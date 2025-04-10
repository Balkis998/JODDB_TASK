import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Core/Language/change_lang.dart';
import 'Core/Language/config.dart';
import 'Core/Services/globals.dart';
import 'Core/Utils/bloc_observer.dart';
import 'Core/Utils/locator.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();

  await EasyLocalization.ensureInitialized();

  Bloc.observer = AppBlocObserver();

  lang = 'en';
  local = ConfigLanguage.enLocale;

  runApp(
    EasyLocalization(
      supportedLocales: const [
        ConfigLanguage.arLocale,
        ConfigLanguage.enLocale,
      ],
      path: ConfigLanguage.langPath,
      fallbackLocale: ConfigLanguage.enLocale,
      child: MultiBlocProvider(providers: [], child: const MyApp()),
    ),
  );
}
