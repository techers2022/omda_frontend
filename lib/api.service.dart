import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:omda_frontend/constants.dart';
import 'package:omda_frontend/user.model.dart';

class ApiService {
  Future<List<User>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<User> model = userFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}