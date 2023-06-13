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
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 30,
            width: 140,
            decoration: const BoxDecoration(
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
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        CupertinoIcons.calendar_today,
                        color: Colors.white,
                      ),
                      Text(
                        '${now.year}-${now.month}-${now.day + index}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Temperature",
            style: TextStyle(fontSize: 24),
          ),
          Text(
            data.temperature.toString() + degreeSymbol + 'C',
            style: const TextStyle(fontSize: 48),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'Astronomical Information',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      const Icon(
                        CupertinoIcons.sunrise,
                        size: 30,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        data.sunrise,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Sunrise",
                        textScaleFactor: 1.2,
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      const Icon(
                        CupertinoIcons.sunset,
                        size: 30,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        data.sunset,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Sunset",
                        textScaleFactor: 1.2,
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      const Icon(
                        CupertinoIcons.moon_stars,
                        size: 30,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        data.moonrise,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Moonrise",
                        textScaleFactor: 1.2,
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      const Icon(
                        CupertinoIcons.moon_zzz,
                        size: 30,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        data.moonset,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Moonset",
                        textScaleFactor: 1.2,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.black54,
            height: 2,
          ),
        ],
      ),
    );
  }
}
