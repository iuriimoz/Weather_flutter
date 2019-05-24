import 'package:weather/business/model/city.dart';

class CitiesProvider {

  List<City> get cities {
    return [
      City(703448, "Kiev"),
      City(2643743, "London"),
      City(2172517, "Canberra"),
      City(4450315, "Washington"),
      City(1816670, "Beijing"),
    ];
  }
}