class GenderModel {

  final String name;
  final String gender;

  GenderModel({
    required this.name,
    required this.gender
  });

  factory GenderModel.fromJsonMap(Map<String, dynamic> json) => GenderModel(
    name: json['name'],
    gender: json['gender'],
  );
}