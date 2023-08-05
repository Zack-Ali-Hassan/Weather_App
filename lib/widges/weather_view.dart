import 'package:cimilosheeg/extensions.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key, required this.weather});
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: '${weather.areaName},  ${weather.country}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text: '\nUpdated: ${weather.date!.format} ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w100,
                    height: 1.7,
                  ),
                ),
                TextSpan(
                  text:
                      '\n\n ${weather.temperature!.celsius!.round()..toStringAsFixed(1)}',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                TextSpan(
                  text: '°C',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                TextSpan(
                  text: '\n ${weather.weatherDescription} ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
