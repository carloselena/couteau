import 'package:couteau/infrastructure/models/gender/gender_model.dart';
import 'package:dio/dio.dart';

class GetGenderAnswer {
  final String name;
  final _dio = Dio();

  GetGenderAnswer({
    required this.name
  });

  Future<String> getAnswer() async {
    
    final response = await _dio.get('https://api.genderize.io/?name=$name');

    final genderModel = GenderModel.fromJsonMap(response.data);

    return genderModel.gender;
  }
}