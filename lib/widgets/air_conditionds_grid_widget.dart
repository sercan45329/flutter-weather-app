import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/utils/my_colors.dart';
import '../utils/pyhsical_screen.dart';

class AirConditionsGrid extends StatelessWidget {
  final Weather weather;
  final String title;
  final IconData icon;
  final String value;
  const AirConditionsGrid(
      {super.key,
      required this.weather,
      required this.title,
      required this.icon,
      required this.value});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = PhysicalScreen.height(context);
    final MyColors colorPalette = MyColors();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(screenHeight * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: colorPalette.myGray,
                size: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: screenHeight * 0.01),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 13,
                    color: colorPalette.myGray,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: screenHeight * 0.05),
          child: Text(
            value,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
