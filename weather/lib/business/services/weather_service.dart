import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather/business/model/city.dart';
import 'package:weather/business/model/weather_data.dart';

class WeatherService {
  static const _apiKey = "7b61e9020f9b0b0746af3e03f1ee4dd7";
  static const _weatherURL = "http://api.openweathermap.org/data/2.5/weather?";

  Future<WeatherData> weatherData(City city) async {
    final url = WeatherService._weatherURL +
        "appid=${WeatherService._apiKey}" +
        "&id=${city.id}" +
        "&units=metric";

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return WeatherData.fromJSON(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
