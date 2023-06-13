import 'package:easier_ui/bloc/weather_bloc/weather_bloc.dart';
import 'package:easier_ui/bloc/weather_bloc/weather_event.dart';
import 'package:easier_ui/bloc/weather_bloc/weather_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/current_weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String degreeSymbol = String.fromCharCode(0x00B0);
  @override
  void initState() {
    super.initState();
    BlocProvider.of<WeatherBloc>(context, listen: false)
        .add(FetchWeatherEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF42C6FF),
      body: SafeArea(
        child: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, state) {
            if (state is ErrorWeatherState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is SuccessWeatherState) {
              DateTime now = DateTime.now();

              final data = state.forecast.weatherList[0];
              return WeatherWidget(
                now: now,
                data: data,
                degreeSymbol: degreeSymbol,
                state: state,
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
                      child: const Text('Try again')),
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 40, right: 20, bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Weather forecast",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            FloatingActionButton(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
              ),
              onPressed: (() => Navigator.pushNamed(context, '/forecast')),
            ),
          ],
        ),
      ),
    );
  }
}
