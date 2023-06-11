import 'package:easier_ui/bloc/weather_bloc/weather_event.dart';
import 'package:easier_ui/bloc/weather_bloc/weather_state.dart';
import 'package:easier_ui/data/repositories/weather_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(InitialWeatherState()) {
    on<FetchWeatherEvent>((event, emit) => fetchWeatherData(emit));
    // on<CurrentWeatherEvent>((event, emit) => retrieveCurrentWeatherData(emit));
    // on<FutureWeatherEvent>((event, emit) => retrieveFutureWeatherData());
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

  // void retrieveCurrentWeatherData(Emitter emit) {
  //   final state = this.state;
  //   emit(LoadingWeatherState());
  //   try {
  //     if (state is SuccessWeatherState) {
  //       emit(state);
  //     } else if (state is FutureWeatherState) {
  //       emit(SuccessWeatherState(
  //           location: state.forecast.country,
  //           weather: state.forecast.weatherList[0],
  //           forecast: state.forecast));
  //     }
  //   } catch (e) {
  //     emit(ErrorWeatherState(errorMessage: e.toString()));
  //   }
  // }

  // void retrieveFutureWeatherData() {

  // }
}
