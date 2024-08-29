import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/day.dart';
import '../models/weather.dart';
import '../utils/my_colors.dart';
import '../utils/pyhsical_screen.dart';

class DailyWeatherForecast extends StatelessWidget {
  final double width;
  final double height;
  final int dayIndex;
  final Weather weather;
  const DailyWeatherForecast(
      {required this.weather,
      required this.dayIndex,
      required this.height,
      required this.width,
      super.key});

  @override
  Widget build(BuildContext context) {
    const Map<String, String> abbreviationDays = {
      "Monday": "Mon",
      "Tuesday": "Tue",
      "Wednesday": "Wed",
      "Thursday": "Thu",
      "Friday": "Fri",
      "Saturday": "Sat",
      "Sunday": "Sun"
    };
    final double screenWidth = PhysicalScreen.width(context);
    final double screenHeight = PhysicalScreen.height(context);
    final MyColors colorPalette = MyColors();
    final Day day = weather.forecast!.forecastday![dayIndex].day!;
    final String pngName = weather
        .forecast!.forecastday![dayIndex].day!.condition!.icon!
        .substring(weather
                .forecast!.forecastday![dayIndex].day!.condition!.icon!.length -
            7);
    String dayName = dayIndex == 0
        ? "Today"
        : DateFormat('EEEE')
            .format(weather.forecast!.forecastday![dayIndex].date!);
    dayName = (dayName == "Today" ? "Today" : abbreviationDays[dayName])!;
    return SizedBox(
      width: width,
      height: height,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              dayName,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: colorPalette.myDarkGray),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    "assets/images/day/$pngName",
                    fit: BoxFit.cover,
                    width: screenWidth * 0.06,
                    height: screenHeight * 0.06,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: screenWidth * 0.02,
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: SizedBox(
                    child: Text(
                      day.condition!.text!,
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Text(
                  day.maxtempC.toString(),
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.bold),
                ),
                Text(
                  "/${day.mintempC}",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: colorPalette.myDarkGray),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
