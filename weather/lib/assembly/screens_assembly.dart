import 'package:flutter/material.dart';
import 'package:weather/assembly/services_assembly.dart';
import 'package:weather/ui/cities/cities_screen.dart';
import 'package:weather/ui/cities/cities_bloc.dart';
import 'package:weather/ui/weather_details/weather_details_screen.dart';
import 'package:weather/ui/weather_details/weather_details_bloc.dart';
import 'package:weather/business/model/city.dart';

class ScreensAssembly {

  ServicesAssembly _servicesAssembly;

  ScreensAssembly(this._servicesAssembly);

  // Interface

  Widget citiesScreen() {
    final bloc = CitiesBloc(_servicesAssembly.citiesProvider);

    return CitiesScreen(bloc);
  }

  Widget weatherDetailsScreen(City city) {
    final bloc = WeatherDetailsBloc(city, _servicesAssembly.weatherService);

    return WeatherDetailsScreen(bloc);
  }
}