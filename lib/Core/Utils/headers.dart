import 'package:shared_preferences/shared_preferences.dart';
import '../Services/globals.dart';
import 'locator.dart';

Map<String, String> globalHeaders = {
  "Accept": "application/json",
  "Content-type": "application/json",
  "Accept-Language": lang,
};

Future<Map<String, String>> getHeadersWithToken() async {
  final prefs = locator<SharedPreferences>();
  String? token = prefs.getString('access_token');

  Map<String, String> headersAuth = {
    "Accept": "application/json",
    "Content-type": "application/json",
    "Accept-Language": lang,
  };

  if (token != null && token.isNotEmpty) {
    headersAuth["Authorization"] = "Bearer $token";
  }

  return headersAuth;
}
