import 'package:flutter/material.dart';
import '../models/weather.dart';
import '../utils/my_colors.dart';
import '../utils/pyhsical_screen.dart';
import 'daily_weather_forecast_widget.dart';

class TomorrowForecastContainer extends StatelessWidget {
  final Weather weather;
  const TomorrowForecastContainer({required this.weather, super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = PhysicalScreen.width(context);
    final double screenHeight = PhysicalScreen.height(context);
    final MyColors colorPalette = MyColors();
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.01, horizontal: screenHeight * 0.02),
      height: screenHeight * 0.15,
      width: screenWidth * 0.8,
      decoration: BoxDecoration(
          color: colorPalette.myLightGray,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "TOMORROW'S FORECAST",
              style: TextStyle(fontSize: 12),
            ),
            DailyWeatherForecast(
                weather: weather,
                dayIndex: 1,
                height: screenHeight * 0.07,
                width: double.infinity),
          ],
        ),
      ),
    );
  }
}
