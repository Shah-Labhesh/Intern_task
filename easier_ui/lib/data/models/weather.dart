import 'dart:convert';

class Weather {
  num temperature;
  String sunrise;
  String sunset;
  String moonrise;
  String moonset;

  Weather({
    required this.temperature,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temperature': temperature,
      'sunrise': sunrise,
      'sunset': sunset,
      'moonrise': moonrise,
      'moonset': moonset,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      temperature: map['day']['avgtemp_c'] as num,
      sunrise: map['astro']['sunrise'] as String,
      sunset: map['astro']['sunset'] as String,
      moonrise: map['astro']['moonrise'] as String,
      moonset: map['astro']['moonset'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source) as Map<String, dynamic>);
}
