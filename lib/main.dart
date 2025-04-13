import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'Core/Language/change_lang.dart';
import 'Core/Language/config.dart';
import 'Core/Services/globals.dart';
import 'Core/Utils/bloc_observer.dart';
import 'Core/Utils/locator.dart';
import 'Features/Main/Presentation/BloC/MainCubit/main_screen_cubit.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  await Hive.openBox('tasksBox');

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
      child: BlocProvider(
        create: (context) => locator<MainScreenCubit>(),
        child: const MyApp(),
      ),
    ),
  );
}
