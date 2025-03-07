import 'package:couteau/infrastructure/models/country_universities/country_universities_model.dart';
import 'package:dio/dio.dart';

class GetUniversitiesAnswer {
  final String countryName;
  final _dio = Dio();

  GetUniversitiesAnswer({
    required this.countryName
  });

  Future<List<University>> getAnswer() async {
    
    final response = await _dio.get('http://universities.hipolabs.com/search?country=$countryName');

    return (response.data as List)
      .map((json) => University.fromJsonMap(json))
      .toList();
  }
}