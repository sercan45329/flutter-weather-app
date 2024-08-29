import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/utils/my_colors.dart';
import 'package:weather_app/utils/pyhsical_screen.dart';
import 'package:weather_app/widgets/air_conditionds_grid_widget.dart';

class AirConditionsContainer extends StatelessWidget {
  final Weather weather;
  const AirConditionsContainer({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = PhysicalScreen.width(context);
    final double screenHeight = PhysicalScreen.height(context);
    final MyColors colorPalette = MyColors();
    final double chanceOfRain = weather.current!.precipMm!;
    final double wind = weather.current!.windKph!;
    final double uvIndex = weather.current!.uv!;
    final double realFeel = weather.current!.feelslikeC!;
    return Container(
      width: screenWidth * 0.8,
      height: screenHeight * 0.3,
      decoration: BoxDecoration(
          color: colorPalette.myLightGray,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: screenHeight * 0.020, top: screenHeight * 0.01),
              child: const Text(
                "AIR CONDITIONS",
                style: TextStyle(fontSize: 12),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(screenHeight * 0.02),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                              child: AirConditionsGrid(
                            weather: weather,
                            icon: FontAwesomeIcons.thermometerHalf,
                            title: "Real Feel",
                            value: "$realFeel°",
                          )),
                          Expanded(
                              child: AirConditionsGrid(
                            weather: weather,
                            icon: FontAwesomeIcons.wind,
                            title: "Wind",
                            value: "$wind kph",
                          )),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                              child: AirConditionsGrid(
                            weather: weather,
                            icon: FontAwesomeIcons.umbrella,
                            title: "Chance Of Rain",
                            value: "$chanceOfRain%",
                          )),
                          Expanded(
                              child: AirConditionsGrid(
                            weather: weather,
                            icon: FontAwesomeIcons.sun,
                            title: "UV Index",
                            value: "$uvIndex",
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
