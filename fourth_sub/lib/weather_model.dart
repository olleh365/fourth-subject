class WeatherModel {
  final String main;
  final double temp;
  final String cityName;
  final double wind;
  final int humidity;
  final double tempMin;
  final double tempMax;
  final int timezone;


  WeatherModel({
    required this.main,
    required this.temp,
    required this.cityName,
    required this.wind,
    required this.humidity,
    required this.tempMin,
    required this.tempMax,
    required this.timezone
  });

  factory WeatherModel.fromJson(Map<String, dynamic>jsonData) {
    return WeatherModel(
      main: jsonData['weather'][0]['main'],
      temp: jsonData['main']['temp'],
      cityName: jsonData['name'],
      wind: jsonData['wind']['speed'],
      humidity: jsonData['main']['humidity'],
      tempMin: jsonData['main']['temp_min'],
      tempMax: jsonData['main']['temp_max'],
      timezone: jsonData['timezone']
    );
  }
  DateTime get localTime {
    return DateTime.now().toUtc().add(Duration(seconds: timezone));
  }
}