import 'package:flutter/material.dart';
import '../../Features/Auth/Presentation/View/login_screen.dart';
import '../../Features/Auth/Presentation/View/register_screen.dart';
import '../../Features/Home/Presentation/View/home_screen.dart';
import '../../Features/Main/Presentation/View/main_screen.dart';
import '../../Features/Notification/Presentation/View/notification_screen.dart';
import '../../Features/Profile/Presentation/View/profile_screen.dart';
import '../../Features/Settings/Presentation/View/settings_screen.dart';
import '../../Features/Splash/Presentation/View/splash_screen.dart';
import '../../Features/Task/Presentation/View/task_screen.dart';

class AppRoutes {
  Map<String, WidgetBuilder> routes = {
    SplashScreen.id: (context) => const SplashScreen(),
    LoginScreen.id: (context) => const LoginScreen(),
    RegisterScreen.id: (context) => const RegisterScreen(),
    MainScreen.id: (context) => const MainScreen(),
    HomeScreen.id: (context) => const HomeScreen(),
    CreateTaskScreen.id: (context) => const CreateTaskScreen(),
    NotificationScreen.id: (context) => const NotificationScreen(),
    ProfileScreen.id: (context) => const ProfileScreen(),
    SettingsScreen.id: (context) => const SettingsScreen(),
  };
}
