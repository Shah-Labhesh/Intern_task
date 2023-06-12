// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easier_ui/data/models/forecast.dart';
import 'package:easier_ui/data/models/weather.dart';

abstract class WeatherState {
  String get location => 'Nepal';
}

class InitialWeatherState extends WeatherState {}

class LoadingWeatherState extends WeatherState {}

class SuccessWeatherState extends WeatherState {
  @override
  String location;
  Weather weather;
  Forecast forecast;
  SuccessWeatherState({
    required this.location,
    required this.weather,
    required this.forecast,
  });
}

class ErrorWeatherState extends WeatherState {
  String errorMessage;
  ErrorWeatherState({
    required this.errorMessage,
  });
}

// class FutureWeatherState extends WeatherState {
//   Forecast forecast;
//   FutureWeatherState({
//     required this.forecast,
//   });
// }
