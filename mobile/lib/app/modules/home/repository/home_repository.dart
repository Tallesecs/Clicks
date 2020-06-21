// import 'package:covid_charts/app/shared/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/covid_data_model.dart';

class HomeRepository {
  Future<CovidData> getDataFromBrazil({String dateForRequest}) async {
    var url = 'https://covid19-brazil-api.now.sh/api/report/v1/brazil/$dateForRequest';
    var header = {"Content-type": "application/json"};

    var response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      print('Ok');
      Map mapResponse = json.decode(response.body);
      return CovidData.fromJson(mapResponse);
    } else {
      return null;
    }
  }
}
