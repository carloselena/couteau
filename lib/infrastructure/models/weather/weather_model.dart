class WeatherModel {

  final double temp;
  final double feelsLike;
  final int humidity;
  final double wind;
  final String description;

  WeatherModel({
    required this.temp,
    required this.feelsLike,
    required this.humidity,
    required this.wind,
    required this.description
  });

  factory WeatherModel.fromJsonMap(Map<String, dynamic> json) => WeatherModel(
    temp: json['main']['temp'],
    feelsLike: json['main']['feels_like'],
    humidity: json['main']['humidity'],
    wind: json['wind']['speed'],
    description: json['weather'][0]['description']
  );
}