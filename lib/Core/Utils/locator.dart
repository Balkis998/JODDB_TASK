import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Features/Auth/Presentation/BloC/AuthCubit/auth_cubit.dart';
import '../../Features/Main/Presentation/BloC/MainCubit/main_screen_cubit.dart';

// Initialize GetIt
final GetIt locator = GetIt.instance;

void setupLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  // Register SharedPreferences
  locator.registerSingleton<SharedPreferences>(sharedPreferences);

  // Firebase Auth instance
  locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  locator.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

  // Register AuthCubit with FirebaseAuth injected
  locator.registerFactory(
    () => AuthCubit(locator<FirebaseAuth>(), locator<FirebaseFirestore>()),
  );

  locator.registerLazySingleton<MainScreenCubit>(() => MainScreenCubit());
}
