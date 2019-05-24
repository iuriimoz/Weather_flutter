import 'package:weather/business/services/cities_provider.dart';
import 'package:weather/business/services/weather_service.dart';


class ServicesAssembly {
  
  final _citiesProvider = CitiesProvider();
  final _weatherService = WeatherService();

  // Interface

  CitiesProvider get citiesProvider => _citiesProvider;

  WeatherService get weatherService => _weatherService;
}