// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Core/Routes/app_routes.dart';
import 'Core/Theme/custom_theme.dart';
import 'Features/Splash/Presentation/View/splash_screen.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 1083),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (c, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          title: 'JODDB APP',
          theme: CustomTheme.lightTheme(context),
          themeMode: ThemeMode.light,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          initialRoute: SplashScreen.id,
          routes: AppRoutes().routes,
        );
      },
    );
  }
}
