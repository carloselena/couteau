class WeatherModel {

  final double temp;
  final double feelsLike;
  final double minTemp;
  final double maxTemp;
  final double pressure;
  final double humidity;
  final String description;

  WeatherModel({
    required this.temp,
    required this.feelsLike,
    required this.minTemp,
    required this.maxTemp,
    required this.pressure,
    required this.humidity,
    required this.description
  });

  factory WeatherModel.fromJsonMap(Map<String, dynamic> json) => WeatherModel(
    temp: json['main']['temp'],
    feelsLike: json['main']['feels_like'],
    minTemp: json['main']['temp_min'],
    maxTemp: json['main']['temp_max'],
    pressure: json['main']['pressure'],
    humidity: json['main']['humidity'],
    description: json['weather']['description']
  );
}