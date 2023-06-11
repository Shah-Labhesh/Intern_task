import 'dart:convert';

import 'package:easier_ui/data/models/weather.dart';

class Forecast {
  String country;
  List<Weather> weatherList;
  Forecast({
    required this.country,
    required this.weatherList,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'country': country,
      'weather': weatherList.map((x) => x.toMap()).toList(),
    };
  }

  factory Forecast.fromMap(Map<String, dynamic> map) {
    return Forecast(
      country: map['location']['country'] as String,
      weatherList: List<Weather>.from(
        (map['forecast']['forecastday'] as List<int>).map<Weather>(
          (x) => Weather.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Forecast.fromJson(String source) =>
      Forecast.fromMap(json.decode(source) as Map<String, dynamic>);
}
