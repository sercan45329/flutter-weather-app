import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherApi {
  static final WeatherApi _singleton = WeatherApi._internal();
  factory WeatherApi() {
    return _singleton;
  }

  WeatherApi._internal();
  static const String _baseUrl = 'http://api.weatherapi.com/v1';
  static const String _apiKey = 'YOUR_API_KEY_HERE';

  Future<Map<String, dynamic>> getCurrentWeather(String location) async {
    final response = await http
        .get(Uri.parse('$_baseUrl/current.json?key=$_apiKey&q=$location'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load current weather');
    }
  }

  Future<Map<String, dynamic>> getCurrentWeatherForecastInDays(
      String location, int days) async {
    final response = await http.get(Uri.parse(
        '$_baseUrl/forecast.json?key=$_apiKey&q=$location&days=$days'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load current weather');
    }
  }
}
