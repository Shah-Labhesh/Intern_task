import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easier_ui/constant/api.dart';
import 'package:easier_ui/data/models/forecast.dart';

class WeatherAPI {
  final dio = Dio();

  Future<Forecast> fetchWeatherDetails() async {
    var response = await dio.get(api);
    var decodedData = jsonDecode(response.data);
    return Forecast.fromJson(decodedData);
  }
}
