import 'package:easier_ui/bloc/weather_bloc/weather_bloc.dart';
import 'package:easier_ui/screens/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/forecast_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/weather',
        routes: {
          '/forecast': (context) => const ForecastScreen(),
          '/weather': (context) => const WeatherScreen(),
        },
      ),
    );
  }
}
