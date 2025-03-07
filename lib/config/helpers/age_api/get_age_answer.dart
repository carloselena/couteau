import 'package:couteau/infrastructure/models/age/age_model.dart';
import 'package:dio/dio.dart';

class GetAgeAnswer {
  final String name;
  final _dio = Dio();

  GetAgeAnswer({
    required this.name
  });

  Future<AgeModel> getAnswer() async {
    
    final response = await _dio.get('https://api.agify.io/?name=$name');

    final ageModel = AgeModel.fromJsonMap(response.data);

    return ageModel;
  }
}