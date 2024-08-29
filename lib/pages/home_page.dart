import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/utils/my_colors.dart';
import 'package:weather_app/widgets/air_conditions_container_widget.dart';
import 'package:weather_app/widgets/seven_day_forecast_container_widget.dart';
import 'package:weather_app/widgets/today_forecast_container_widget.dart';
import '../utils/pyhsical_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = PhysicalScreen.width(context);
    final double screenHeight = PhysicalScreen.height(context);
    final MyColors colorPalette = MyColors();
    return Scaffold(
      body: FutureBuilder<Weather>(
        future: WeatherService.getCurrentWeatherWithForecast(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          Weather weather = snapshot.data!;
          return Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.15),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      weather.location!.name!,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Chance of rain: ${weather.current!.precipMm!.toInt()}%",
                      style: TextStyle(
                        fontSize: 18,
                        color: colorPalette.myGray,
                      ),
                    ),
                    Image.asset(
                      height: screenHeight * 0.2,
                      width: screenWidth * 0.3,
                      "assets/images/day/${weather.current!.condition!.icon!.substring(weather.current!.condition!.icon!.length - 7)}",
                      fit: BoxFit.contain,
                    ),
                    Text(
                      "${weather.current!.tempC!}°",
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.05),
                        child: TodayForecastContainer(weather: weather)),
                    Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.02),
                        child: TomorrowForecastContainer(weather: weather)),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                        child: AirConditionsContainer(weather: weather)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
