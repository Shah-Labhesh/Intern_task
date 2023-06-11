import 'package:easier_ui/bloc/weather_bloc/weather_bloc.dart';
import 'package:easier_ui/bloc/weather_bloc/weather_event.dart';
import 'package:easier_ui/bloc/weather_bloc/weather_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                final data = state.forecast.weatherList[0];
                return Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/bg2.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    state.location,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 40, right: 40),
                              child: Text(
                                "Temperature  " +
                                    data.temperature.toString() +
                                    degreeSymbol +
                                    "C",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 34),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 270,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  'Weather Today',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: List.filled(
                                              20,
                                              BoxShadow(
                                                  color: Colors.black45,
                                                  blurRadius: 1.0,
                                                  blurStyle: BlurStyle.outer))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          children: [
                                            Icon(CupertinoIcons.sunrise),
                                            Text(data.sunrise)
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Icon(CupertinoIcons.sunset),
                                        Text(data.sunset)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Icon(CupertinoIcons.moon_stars),
                                        Text(data.moonrise)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Icon(CupertinoIcons.moon_zzz),
                                        Text(data.moonset)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
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
                        child: Text('Try again')),
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_forward_ios_outlined),
          onPressed: (() => Navigator.pushNamed(context, '/forecast')),
        ));
  }
}
