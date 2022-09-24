import 'dart:convert';
import 'dart:developer';
import 'package:omda_frontend/constants/api.constants.dart';
import 'package:http/http.dart' as http;
import 'package:omda_frontend/src/shared/user-data.dart';

class PostWorkService {
  Future<bool> postWork(
    String category,
    String title,
    String description,
    String date,
    String location,
    String duration,
    String price,
  ) async {
    try {
      var url = Uri.parse('${ApiConstants.baseUrl}/create-work');
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: json.encode({
            "userId": UserData.id,
            "title": title,
            "category": category,
            "description": description,
            "date": date,
            "location": location,
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
}
