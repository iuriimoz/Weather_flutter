import 'package:weather/business/services/cities_provider.dart';
import 'package:weather/business/model/city.dart';

class CitiesBloc {

  CitiesProvider _citiesProvider;

  CitiesBloc(this._citiesProvider);

  // Interface

  List<City> get cities => _citiesProvider.cities;
}