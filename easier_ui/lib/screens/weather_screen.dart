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
                DateTime now = DateTime.now();

                final data = state.forecast.weatherList[0];
                return Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xFF42C6FF),
                    ),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    state.location,
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 140,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      10,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      CupertinoIcons.calendar_today,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      '${now.year}-${now.month}-${now.day}',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Temperature ",
                                    style: TextStyle(
                                        // color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 50),
                                  ),
                                  Text(
                                    data.temperature.toString() +
                                        degreeSymbol +
                                        "C",
                                    style: TextStyle(
                                        // color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 80),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 330,
                          width: MediaQuery.of(context).size.width,
                          // decoration: BoxDecoration(color: Color(0xFF42C6FF)),
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
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        children: [
                                          Icon(
                                            CupertinoIcons.sunrise,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            data.sunrise,
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Sunrise",
                                            textScaleFactor: 1.2,
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        children: [
                                          Icon(
                                            CupertinoIcons.sunset,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            data.sunset,
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Sunset",
                                            textScaleFactor: 1.2,
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        children: [
                                          Icon(
                                            CupertinoIcons.moon_stars,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            data.moonrise,
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Moonrise",
                                            textScaleFactor: 1.2,
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        children: [
                                          Icon(
                                            CupertinoIcons.moon_zzz,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            data.moonset,
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Moonset",
                                            textScaleFactor: 1.2,
                                          )
                                        ],
                                      ),
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
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 40, right: 20, bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
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
        ));
  }
}
