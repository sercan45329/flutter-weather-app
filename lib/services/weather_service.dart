import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/letter_converter_service.dart';
import 'package:weather_app/services/location_service.dart';

class WeatherService {
  static Future<Weather> getCurrentWeatherWithForecast() async {
    var placeMarks = await LocationService.getCurrentPosition();
    if (placeMarks.isNotEmpty && placeMarks[0].administrativeArea != null) {
      String englishLocationName =
          LetterConverterService.convertTurkishToEnglish(
              placeMarks[0].administrativeArea!);
      Map<String, dynamic> stringJson = await WeatherApi()
          .getCurrentWeatherForecastInDays(englishLocationName, 2);
      Weather weather = Weather.fromJson(stringJson);
      return weather;
    } else {
      throw Exception('Administrative area is null');
    }
  }
}
