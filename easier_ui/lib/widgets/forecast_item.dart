// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/models/weather.dart';

class ForecastWidget extends StatelessWidget {
  const ForecastWidget({
    Key? key,
    required this.day,
    required this.now,
    required this.data,
    required this.degreeSymbol,
    required this.index,
  }) : super(key: key);

  final String day;
  final DateTime now;
  final Weather data;
  final String degreeSymbol;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: Column(
        children: [
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
            child: (index == 0 || index == 1)
                ? Text(
                    day,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        CupertinoIcons.calendar_today,
                        color: Colors.white,
                      ),
                      Text(
                        '${now.year}-${now.month}-${now.day + index}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Temperature",
            style: TextStyle(fontSize: 24),
          ),
          Text(
            data.temperature.toString() + degreeSymbol + 'C',
            style: TextStyle(fontSize: 48),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Astronomical Information',
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10)),
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
                      borderRadius: BorderRadius.circular(10)),
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
                      borderRadius: BorderRadius.circular(10)),
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
                      borderRadius: BorderRadius.circular(10)),
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
          Divider(
            color: Colors.black54,
            height: 2,
          ),
        ],
      ),
    );
  }
}
