import 'dart:developer';
import 'package:omda_frontend/constants/api.constants.dart';
import 'package:http/http.dart' as http;
import 'package:omda_frontend/src/features/do-work/models/work-simple.model.dart';
import 'package:omda_frontend/src/shared/user-data.dart';

class MyWorksService {
  Future<List<WorkSimpleModel>> getAllWorksFromUser() async {
    try {
      var url = Uri.parse('${ApiConstants.baseUrl}/get-works-from-user/${UserData.id}');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<WorkSimpleModel> model = workSimpleModelsFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }

    return [];
  }

  Future<List<WorkSimpleModel>> getAllWorksAcceptedByUser() async {
    try {
      var url = Uri.parse('${ApiConstants.baseUrl}/get-works-accepted-by-user/${UserData.id}');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<WorkSimpleModel> model = workSimpleModelsFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }

    return [];
  }
}
