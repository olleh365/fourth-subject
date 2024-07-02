class WeatherModel {
  final String main;
  final String description;
  final double temp;
  final String cityName;

  WeatherModel({
    required this.main,
    required this.description,
    required this.temp,
    required this.cityName,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      main: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      temp: json['main']['temp'].toDouble(),
      cityName: json['name'],
    );
  }
}