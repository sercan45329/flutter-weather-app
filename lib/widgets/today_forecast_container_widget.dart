import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/utils/my_colors.dart';
import 'package:weather_app/utils/pyhsical_screen.dart';
import 'package:weather_app/widgets/hourly_weather_forecast_widget.dart';

class TodayForecastContainer extends StatelessWidget {
  final Weather weather;
  const TodayForecastContainer({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = PhysicalScreen.width(context);
    final double screenHeight = PhysicalScreen.height(context);
    final MyColors colorPalette = MyColors();
    return Container(
      width: screenWidth * 0.8,
      height: screenHeight * 0.25,
      decoration: BoxDecoration(
          color: colorPalette.myLightGray,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: screenHeight * 0.020),
              child: const Text(
                "TODAY'S FORECAST",
                style: TextStyle(fontSize: 12),
              ),
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HourlyWeatherForecast(
                    weather: weather,
                    hourIndex: 9,
                    height: screenHeight * 0.15,
                    width: screenWidth * 0.225,
                  ),
                  const VerticalDivider(),
                  HourlyWeatherForecast(
                    weather: weather,
                    hourIndex: 12,
                    height: screenHeight * 0.15,
                    width: screenWidth * 0.225,
                  ),
                  const VerticalDivider(),
                  HourlyWeatherForecast(
                    weather: weather,
                    hourIndex: 15,
                    height: screenHeight * 0.15,
                    width: screenWidth * 0.225,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
