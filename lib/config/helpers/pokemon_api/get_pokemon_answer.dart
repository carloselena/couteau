import 'package:couteau/infrastructure/models/pokemon/pokemon_model.dart';
import 'package:dio/dio.dart';

class GetPokemonAnswer {
  final String name;
  final _dio = Dio();

  GetPokemonAnswer({required this.name});

  Future<dynamic> getAnswer() async {
    final Response<dynamic> response;
    final PokemonModel pokemonModel;

    try {
      response = await _dio.get('https://pokeapi.co/api/v2/pokemon/$name');
      pokemonModel = PokemonModel.fromJsonMap(response.data);
      return pokemonModel;
    } on DioException {
      return;
    }
  }
}
