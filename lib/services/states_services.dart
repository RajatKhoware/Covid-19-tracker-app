import 'dart:convert';
import 'package:flutter_covid_ui/services/utils.dart';
import 'package:http/http.dart' as http;

import '../models/world_model.dart';

class StatesServices {

  Future<WorldStateModel> fetchWorldStateRecords() async {
    final res = await http.get(Uri.parse(ApiUri.baseurl));

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body.toString());
      return WorldStateModel.fromJson(data);
    } else {
      throw Exception("Error-404");
    }
  }

  Future<List<dynamic>> countriesListApi() async {
    // ignore: prefer_typing_uninitialized_variables
    var data;
    final res = await http.get(Uri.parse(ApiUri.worldDataApi));
    
    if (res.statusCode == 200) {
      data = jsonDecode(res.body.toString());
      return data;
    } else {
      throw Exception("Error-404");
    }
  }
}
