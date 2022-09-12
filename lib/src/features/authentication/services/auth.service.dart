import 'dart:convert';
import 'dart:developer';
import 'package:omda_frontend/constants/api.constants.dart';
import 'package:http/http.dart' as http;
import 'package:omda_frontend/src/features/authentication/models/user-model.dart';
import 'package:omda_frontend/src/shared/user-data.dart';

class AuthService {
  Future<bool> loginUser(String email, String password) async {
    try {
      var url = Uri.parse('${ApiConstants.baseUrl}/login');
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: json.encode({"email": email, "password": password}));

      if (response.statusCode == 200) {
        var userModel = userModelFromJson(response.body);

        UserData.id = userModel.id;
        UserData.email = userModel.email;
        UserData.firstName = userModel.firstName;
        UserData.lastName = userModel.lastName;
        UserData.description = userModel.description;

        return true;
      }
    } catch (e) {
      log(e.toString());
    }
    return false;
  }
}
