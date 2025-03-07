class AgeModel {

  final String name;
  final int age;

  AgeModel({
    required this.name,
    required this.age,
  });

  factory AgeModel.fromJsonMap(Map<String, dynamic> json) => AgeModel(
    name: json['name'],
    age: json['age'],
  );
}