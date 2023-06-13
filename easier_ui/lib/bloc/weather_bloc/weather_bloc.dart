import 'package:easier_ui/bloc/weather_bloc/weather_event.dart';
import 'package:easier_ui/bloc/weather_bloc/weather_state.dart';
import 'package:easier_ui/data/repositories/weather_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(InitialWeatherState()) {
    on<FetchWeatherEvent>((event, emit) => fetchWeatherData(emit));
  }

  void fetchWeatherData(Emitter emit) async {
    emit(LoadingWeatherState());
    try {
      var data = await WeatherAPI().fetchWeatherDetails();
      emit(SuccessWeatherState(
          location: data.country,
          weather: data.weatherList[0],
          forecast: data));
    } catch (e, s) {
      print(s.toString());
      emit(ErrorWeatherState(errorMessage: e.toString()));
    }
  }
}
