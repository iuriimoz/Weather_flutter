
class WeatherData {
  double temperature; // °C
  double pressure;    // hPa
  double humidity;    // %, 0 to 100
  String description;
  String iconID;

  WeatherData({
    this.temperature,
    this.pressure,
    this.humidity,
    this.description,
    this.iconID});

  factory WeatherData.fromJSON(Map<String, dynamic> json) {
    final main = json["main"];
    final weather = json["weather"][0];

    return WeatherData(
        temperature: main["temp"].toDouble(),
        pressure: main["pressure"].toDouble(),
        humidity: main["humidity"].toDouble(),
        description: weather["description"],
        iconID: weather["icon"]
    );
  }
}