import 'dart:developer';
import 'package:omda_frontend/constants/api.constants.dart';
import 'package:http/http.dart' as http;
import 'package:omda_frontend/src/features/do-work/models/work-detailed.model.dart';
import 'package:omda_frontend/src/features/do-work/models/work-simple.model.dart';

class DoWorkService {
  Future<List<WorkSimpleModel>> getAllWorks() async {
    try {
      var url = Uri.parse('${ApiConstants.baseUrl}/get-all-works');
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

  Future<WorkDetailedModel?> getWorkDetails(String workId) async {
    try {
      var url = Uri.parse('${ApiConstants.baseUrl}/get-work-detailed/$workId');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        WorkDetailedModel model = workDetailedModelFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }

    return null;
  }
}
