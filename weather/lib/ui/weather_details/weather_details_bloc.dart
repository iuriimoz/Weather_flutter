import 'dart:async';
import 'package:weather/business/model/city.dart';
import 'package:weather/business/services/weather_service.dart';
import 'package:weather/business/model/weather_data.dart';
import 'package:weather/ui/weather_details/weather_data_view_model.dart';

class WeatherDetailsBloc {

  final City _city;
  final WeatherService _weatherService;
  bool _isRefreshing = false;

  StreamController<bool> _showLoading = StreamController();
  StreamController<WeatherDataViewModel> _weatherData = StreamController();
  StreamController<String> _errorMessage = StreamController();

  WeatherDetailsBloc(this._city, this._weatherService);

  // Interface

  String get cityName => _city.name;

  Stream<bool> get showLoading => _showLoading.stream;

  Stream<WeatherDataViewModel> get weatherData => _weatherData.stream;

  Stream<String> get errorMessage => _errorMessage.stream;

  void refresh() async {
    if (_isRefreshing) {
      return;
    }

    _showLoading.add(true);

    try {
      WeatherData weatherData = await _weatherService.weatherData(_city);
      final viewModel = WeatherDataViewModel.fromWeatherData(weatherData);

      _weatherData.add(viewModel);
      _errorMessage.add(null);

    } catch (e) {
      _weatherData.add(null);
      _errorMessage.add("Failed to load weather data");
    } finally {
      _showLoading.add(false);
    }
  }

  void dispose() {
    _showLoading.close();
    _weatherData.close();
    _errorMessage.close();
  }
}
