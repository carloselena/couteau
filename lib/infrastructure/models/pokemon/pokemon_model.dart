class PokemonModel {

  final String name;
  final String imageUrl;
  final int baseExperience;
  final List<String> abilities;

  PokemonModel({
    required this.name,
    required this.imageUrl,
    required this.baseExperience,
    required this.abilities
  });

  factory PokemonModel.fromJsonMap(Map<String, dynamic> json) => PokemonModel(
    name: json['name'],
    imageUrl: json['sprites']['front_default'],
    baseExperience: json['base_experience'],
    abilities: List<String>.from(
      json['abilities'].map((a) => a['ability']['name'])
    ),
  );
}