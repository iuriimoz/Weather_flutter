import 'package:test/test.dart';
import 'package:weather/business/model/weather_data.dart';

void main() {
  test('WeatherData should parse JSON', () {
    final temperature = 1;
    final pressure = 2.0;
    final humidity = 3;
    final description = "some description";
    final iconID = "icon_id";

    final json = {
      "main" : { "temp" : temperature, "pressure" : pressure, "humidity" : humidity},
      "weather" : [{ "description" : description, "icon" : iconID }]
    };
    
    final weatherData = WeatherData.fromJSON(json);

    expect(weatherData.temperature, temperature);
    expect(weatherData.pressure,    pressure);
    expect(weatherData.humidity,    humidity);
    expect(weatherData.description, description);
    expect(weatherData.iconID,      iconID);
  });
}

