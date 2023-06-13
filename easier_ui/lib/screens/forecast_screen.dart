import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/weather_bloc/weather_bloc.dart';
import '../bloc/weather_bloc/weather_event.dart';
import '../bloc/weather_bloc/weather_state.dart';
import '../widgets/forecast_item.dart';

class ForecastScreen extends StatefulWidget {
  const ForecastScreen({Key? key}) : super(key: key);

  @override
  State<ForecastScreen> createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  String degreeSymbol = String.fromCharCode(0x00B0);
  late String day = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF42C6FF),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Weather forecast",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFF42C6FF),
      ),
      body: SafeArea(
        child: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, state) {
            if (state is ErrorWeatherState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.errorMessage,
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is SuccessWeatherState) {
              DateTime now = DateTime.now();

              final list = state.forecast.weatherList;
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final data = list[index];
                  if (index == 0) {
                    day = 'Today';
                  } else if (index == 1) {
                    day = 'Tomorrow';
                  }
                  return ForecastWidget(
                    day: day,
                    now: now,
                    data: data,
                    degreeSymbol: degreeSymbol,
                    index: index,
                  );
                },
              );
            } else if (state is ErrorWeatherState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.errorMessage),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<WeatherBloc>(context, listen: false)
                          .add(FetchWeatherEvent());
                    },
                    child: const Text('Try again'),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
