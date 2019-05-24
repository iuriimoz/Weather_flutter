import 'package:weather/business/model/weather_data.dart';
import 'package:sprintf/sprintf.dart';

class WeatherDataViewModel {
  String temperature;
  String pressure;
  String humidity;
  String description;
  String iconURL;

  WeatherDataViewModel({
    this.temperature,
    this.pressure,
    this.humidity,
    this.description,
    this.iconURL});

  factory WeatherDataViewModel.fromWeatherData(WeatherData weatherData) {
    return WeatherDataViewModel(
      temperature: sprintf("%.1f °C", [weatherData.temperature]),
      pressure: sprintf("%.0f hPa", [weatherData.pressure]),
      humidity: sprintf("%.0f%% humidity", [weatherData.humidity]),
      description: weatherData.description,
      iconURL: "http://openweathermap.org/img/w/${weatherData.iconID}.png"
    );
  }
}