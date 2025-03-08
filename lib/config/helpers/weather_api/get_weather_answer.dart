import 'package:couteau/infrastructure/models/weather/weather_model.dart';
import 'package:dio/dio.dart';

class GetWeatherAnswer {
  final String apiKey = '012fb366c69ca47b8cf2938ffd8947df';
  final String city = 'Santo Domingo,DO';
  final _dio = Dio();

  GetWeatherAnswer();

  Future<WeatherModel> getAnswer() async {
    final WeatherModel weatherModel;

    final response = await _dio.get('https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric&lang=es');

    weatherModel = WeatherModel.fromJsonMap(response.data);
    return weatherModel;
  }
}