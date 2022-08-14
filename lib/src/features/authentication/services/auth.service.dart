import 'dart:developer';
import 'package:omda_frontend/constants/api.constants.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<bool> loginUser(String name) async {
    try {
      var url = Uri.parse('${ApiConstants.baseUrl}/users/$name');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      log(e.toString());
    }
    return false;
  }
}