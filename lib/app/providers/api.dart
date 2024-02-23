import 'package:shared_preferences/shared_preferences.dart';

class Api {
  static final String baseUrl = 'http://10.10.10.122:8000/api';

  static Future<Map<String, String>> getHeaders() async {
    SharedPreferences localeStorage = await SharedPreferences.getInstance();
    String? token = localeStorage.getString('token');

    if (token != null) {
      return {'Authorization': 'Bearer $token'};
    } else {
      return {};
    }
  }
}
