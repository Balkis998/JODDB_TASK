import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api_services.dart';

// Initialize GetIt
final GetIt locator = GetIt.instance;

void setupLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  // Register Dio

  locator.registerLazySingleton<Dio>(() => Dio());

  // Register ApiService
  locator.registerLazySingleton<ApiService>(() => ApiService(locator<Dio>()));

  // Register SharedPreferences
  locator.registerSingleton<SharedPreferences>(sharedPreferences);

  // Register AuthRepo with its dependency
}
