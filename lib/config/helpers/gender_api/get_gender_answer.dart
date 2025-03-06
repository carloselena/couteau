import 'package:couteau/infrastructure/models/gender/gender_model.dart';
import 'package:dio/dio.dart';

class GetGenderAnswer {

  final _dio = Dio();

  Future<GenderModel> getAnswer() async {
    
    final response = await _dio.get('https://api.genderize.io/?name=irma');

    final genderModel = GenderModel.fromJsonMap(response.data);

    return genderModel;
  }
}