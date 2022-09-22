import 'dart:convert';
import 'dart:developer';
import 'package:omda_frontend/constants/api.constants.dart';
import 'package:http/http.dart' as http;
import 'package:omda_frontend/src/shared/user-data.dart';
import 'package:intl/intl.dart';

class PostWorkService {
  Future<bool> postWork(String category, String description, String date,
      String duration, String price) async {
    try {
      var url = Uri.parse('${ApiConstants.baseUrl}/create-work');
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: json.encode({
            "userId": UserData.id,
            "category": category,
            "description": description,
            "date": date,
            "duration": duration,
            "price": int.parse(price),
          }));

      if (response.statusCode == 201) {
        return true;
      }
    } catch (e) {
      log(e.toString());
    }

    return false;
  }

  Future<bool> registerUser(String email, String firstName, String lastName,
      String password, String confirmPassword) async {
    try {
      var url = Uri.parse('${ApiConstants.baseUrl}/register');
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: json.encode({
            "email": email,
            "password": password,
            "firstName": firstName,
            "lastName": lastName
          }));

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      log(e.toString());
    }
    return false;
  }
}
