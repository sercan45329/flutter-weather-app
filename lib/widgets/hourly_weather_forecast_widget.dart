import 'package:flutter/material.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/utils/pyhsical_screen.dart';
import '../models/weather.dart';
import '../utils/my_colors.dart';

class HourlyWeatherForecast extends StatelessWidget {
  final double width;
  final double height;
  final int hourIndex;
  final Weather weather;
  const HourlyWeatherForecast(
      {required this.weather,
      required this.hourIndex,
      required this.width,
      required this.height,
      super.key});

  @override
  Widget build(BuildContext context) {
    final MyColors colorPalette = MyColors();
    final double screenWidth = PhysicalScreen.width(context);
    final double screenHeight = PhysicalScreen.height(context);
    Forecastday today = weather.forecast!.forecastday![0];
    String time = today.hour![hourIndex].time!;
    String imagePath =
        "assets/images/day/${today.hour![hourIndex].condition!.icon!.substring(today.hour![hourIndex].condition!.icon!.length - 7)}";
    double degreeInC = today.hour![hourIndex].tempC!;
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        children: [
          Text(
            time.substring(time.length - 5),
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: colorPalette.myDarkGray),
          ),
          Image.asset(
            width: screenWidth * 0.1,
            height: screenHeight * 0.08,
            imagePath,
            fit: BoxFit.cover,
          ),
          Text(
            "$degreeInC°",
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
