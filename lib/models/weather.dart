import 'dart:convert';
import 'current.dart';
import 'forecast.dart';
import 'wlocation.dart';

Weather weatherModelFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherModelToJson(Weather data) => json.encode(data.toJson());

class Weather {
  Wlocation? location;
  Current? current;
  Forecast? forecast;

  Weather({
    this.location,
    this.current,
    this.forecast,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        location: json["location"] == null
            ? null
            : Wlocation.fromJson(json["location"]),
        current:
            json["current"] == null ? null : Current.fromJson(json["current"]),
        forecast: json["forecast"] == null
            ? null
            : Forecast.fromJson(json["forecast"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
        "current": current?.toJson(),
        "forecast": forecast?.toJson(),
      };
}
