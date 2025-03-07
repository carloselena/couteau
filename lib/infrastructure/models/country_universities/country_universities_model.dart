class University {

  final String name;
  final List<String> domains;
  final List<String> webPages;
  


  University({
    required this.name,
    required this.domains,
    required this.webPages
  });

  factory University.fromJsonMap(Map<String, dynamic> json) => University(
    name: json['name'],
    domains: List<String>.from(json['domains']),
    webPages: List<String>.from(json['web_pages']),
  );
}